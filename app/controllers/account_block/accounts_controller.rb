module AccountBlock
  class AccountsController < ApplicationController
    include BxBlockLogin
    include BxBlockQuestionLevalOnes
    include BxBlockIdentifyYourself
    include BuilderJsonWebToken::JsonWebTokenValidation
    
    before_action :validate_json_web_token, only: [:search, :myself, :identify_yourself, :user_identification, :send_otp, :sms_confirmation, :question_of_the_day_ans, :question_leval_one_ans]
    before_action :time_out, only: :question_leval_one_ans
    
    def create
      case params[:data][:type] #### rescue invalid API format
      when 'email_account'
        account_params = jsonapi_deserialize(params)
        query_email = account_params['email'].downcase
        account = EmailAccount.where('LOWER(email) = ?', query_email).first
        validator = EmailValidation.new(account_params['email'])
        return render json: {errors: [
          {account: 'Email invalid'},
        ]}, status: :unprocessable_entity if account || !validator.valid?
        @account = EmailAccount.new(jsonapi_deserialize(params))
        @account.platform = request.headers['platform'].downcase if request.headers.include?('platform')
        if @account.save!
          render json: EmailAccountSerializer.new(@account, meta: {
            token: encode(@account.id),
          }).serializable_hash, status: :created
        else
          render json: {errors: format_activerecord_errors(@account.errors)},
            status: :unprocessable_entity
        end
      end
    end

    def myself
      full_name = params[:data][:attributes][:full_name]
      gender = params[:data][:attributes][:gender]
      interest = params[:data][:attributes][:interest]
      date_of_birth = params[:data][:attributes][:date_of_birth]
      @account.update(full_name: full_name, gender: gender, interest: interest, date_of_birth: date_of_birth)
      if @account.present?
        render json: AccountSerializer.new(@account, meta: {message: 'Details added successfully.'
        }).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'Not found any user.'}]}, status: :unprocessable_entity
      end
    end

    def send_otp
      json_params = jsonapi_deserialize(params)
      account = EmailAccount.find_by(
        full_phone_number: json_params['full_phone_number'],
        activated: true)

      return render json: {errors: [{
        account: 'Account already activated',
      }]}, status: :unprocessable_entity unless account.nil?

      @sms_otp = SmsOtp.new(jsonapi_deserialize(params))
      if @sms_otp.save
        render json: SmsOtpSerializer.new(@sms_otp, meta: {
          message: 'Otp sent Successfully',
        }).serializable_hash, status: :created
      else
        render json: {errors: format_activerecord_errors(@sms_otp.errors)},
          status: :unprocessable_entity
      end
    end

    def sms_confirmation
      begin
        @sms_otp = SmsOtp.where(full_phone_number: params[:full_phone_number]).last
      rescue ActiveRecord::RecordNotFound => e
        return render json: {errors: [
          {phone: 'Phone Number Not Found'},
        ]}, status: :unprocessable_entity
      end

      if @sms_otp.valid_until < Time.current
        @sms_otp.destroy

        return render json: {errors: [
          {pin: 'This Pin has expired, please request a new pin code.'},
        ]}, status: :unauthorized
      end
      
      if @sms_otp.activated?
        return render json: ValidateAvailableSerializer.new(@sms_otp, meta: {
          message: 'Phone Number Already Activated',
        }).serializable_hash, status: :ok
      end
      if 1234 == params['pin'].to_i
        @sms_otp.activated = true
        @sms_otp.save
        AccountBlock::Account.find(@token.id).update(full_phone_number: params['full_phone_number'], activated: true)

        render json: ValidateAvailableSerializer.new(@sms_otp, meta: {
          message: 'Phone Number Confirmed Successfully'
        }).serializable_hash, status: :ok
      else
        return render json: {errors: [
          {pin: 'Invalid Pin for Phone Number'},
        ]}, status: :unprocessable_entity
      end
    end

    def identify_yourself
      @questions = IdentifyYourself.all.to_json
      if @questions.present?
        render json: @questions, status: :ok
      else
        render json: {errors: [{message: 'cannot identify.'}]},status: :unprocessable_entity
      end
    end

    def user_identification
      json_params = jsonapi_deserialize(params)
      @account = AccountBlock::Account.find_by(id: @token.id)
      @answers = json_params['answers']
      result = []
      @answers.each do |answer|
         ans = @account.user_identifications.new(account_id: @account.id, identify_yourself_id: answer['question_id'], correct_answer: answer['correct_answer'])
        ans.save!
        result << ans
      end

      if result.present?
        render json: result, status: :ok
      else
        render json: {errors: [{message: 'no option were selected.'}]},status: :unprocessable_entity
      end
    end

    def search
      @accounts = Account.where(activated: true)
                    .where('first_name ILIKE :search OR '\
                           'last_name ILIKE :search OR '\
                           'email ILIKE :search', search: "%#{search_params[:query]}%")
      if @accounts.present?
        render json: AccountSerializer.new(@accounts, meta: {message: 'List of users.'
        }).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'No user found.'}]}, status: :ok
      end
    end


    def user_current_location
      if params[:allow_location]
       location = Geocoder.search("#{params[:latitude]},#{params[:longitude]}")
       if location.present?
          addresh = location.first.address
          render json:{success: true, data: addresh}
        else
           render json: {errors: [{message: 'Location cant find'}]}
        end
      end
    end

    def question_list
      @list_of_question = BxBlockQuestionLevalOnes::QuestionLevalOne.all
      if @list_of_question.present?
          render json: QuestionListSerializer.new(@list_of_question), status: :ok
        else
        render json: {errors: [{message: 'Questions not found'}]}
      end
    end

    def question_of_the_day
      @list_question_of_the_day = BxBlockQuestionsOfTheDays::QuestionOfTheDay.find_by(date: Date.today)
      if @list_question_of_the_day.present?
        render json: QuestionListSerializer.new(@list_question_of_the_day), status: :ok
      else
        render json: {errors: [{message: 'Questions not present'}]}, status: :ok
      end
    end

   def question_of_the_day_ans
    @account = AccountBlock::Account.find_by(id: @token.id)
    question_ans = BxBlockQuestionsOfTheDays::QuestionOfTheDayAnswer.new(account_id: @account.id, question_of_the_day_id: params[:question_id], correct_answer: params[:correct_answer])
    if question_ans.save
       render json: {success: true}
     else
      render json: {errors: [{message: 'no option were selected.'}]}, status: :ok
    end
   end

    def question_leval_one_ans
      @account = AccountBlock::Account.find_by(id: @token.id)
      question_ans = BxBlockQuestionLevalOnes::QuestionLevalOneAnswer.new(account_id: @account.id, question_leval_one_id: params[:question_id], correct_answer: params[:correct_answer])
      if question_ans.save
        render json: {success: true}
      else
        render json: {errors: [{message: 'no option selected.'}]}, status: :unprocessable_entity
      end
    end
    
   private
    def encode(id)
      BuilderJsonWebToken.encode id
    end

    def search_params
      params.permit(:query)
    end

    def time_out  
      question = BxBlockQuestionLevalOnes::QuestionLevalOne.find_by(id: params[:question_id])
      return render json: {errors: [{message: 'invalid question'}]}, status: :not_found if question.nil?
      games = question.level.games.last
      return render json: {errors: [{message: 'please start your game'}]}, status: :unauthorized if games.nil?
      return render json: {errors: [{message: 'Your time has over'}]}, status: :unauthorized if games.end_at < Time.now
    end
  end
end
