require 'rails_helper'
require 'spec_helper'

RSpec.describe AccountBlock::AccountsController, type: :controller do
	
  describe "#user_current_location" do
    let(:latitude) { 37.7749 }
    let(:longitude) { -122.4194 }
    @question = BxBlockQuestionLevalOnes::QuestionLevalOne.find_or_create_by(question: "dbstructure",option_1: "one",
      option_2: "two")
     @question_of_the_day = BxBlockQuestionsOfTheDays::QuestionOfTheDay.find_or_create_by(question: "dbstructure",option_1: "one",
      option_2: "two", date: "2/2/2022")
    context "current user address" do
      it "current user address find with lat long" do
        get :user_current_location, params: { allow_location: true, latitude: latitude, longitude: longitude } 
        expect(response.status).to eq 200
      end

      it "current user address find without lat long" do
        get :user_current_location, params: { allow_location: true}
        expect(response)
      end
    end

    context "List of questions" do
      it "List of questions" do
        get :question_list
        expect(response.status).to eq 200
      end

      it "Not found questions" do
        get :question_list
        expect(response)
      end   
    end    

    context "Question_of_day" do
      it "question_of_the_present" do
        get :question_of_the_day
        expect(response.status).to eq 200
      end
    end

    context "Question_of_day_ans" do
      it "question_ans" do
        @account = FactoryBot.create(:account)
        @token = BuilderJsonWebToken::JsonWebToken.encode(@account.id)
        params = {token: @token, account_id: @account.id, question_of_the_day_id: 1}
        post :question_of_the_day_ans, params: params
        expect(response).to have_http_status :ok
      end
      it "question_ans" do
        @account = FactoryBot.create(:account)
        @token = BuilderJsonWebToken::JsonWebToken.encode(@account.id)
        params = {token: @token}
        post :question_of_the_day_ans, params: params
        expect(response).to have_http_status :ok
      end
    end 

    context "Question_of_day_ans" do
      it "question_ans" do
        @account = FactoryBot.create(:account)
        @token = BuilderJsonWebToken::JsonWebToken.encode(@account.id)
        @level = FactoryBot.create(:level)
        @game = FactoryBot.create(:game, level_id: @level.id, account_id: @account.id)
        @question = FactoryBot.create(:question, level_id: @level.id)
        params = {token: @token, account_id: @account.id, question_id: @question.id, correct_answer: "Vibrate nigbhood"}
        post :question_leval_one_ans, params: params
        expect(response).to have_http_status :ok
      end
    end 
  end
end
