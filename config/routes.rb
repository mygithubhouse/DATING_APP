Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["Ok"]] }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :account_block do
	resources :accounts, only: [:create]
		# post 'accounts/send_otp', to: 'accounts/send_otps#create'
		# post 'accounts/sms_confirmation', to: 'accounts/sms_confirmations#create'
  end

  namespace :account_block do
	resources :accounts do
		post :myself, on: :collection
		post :send_otp, on: :collection
		post :sms_confirmation, on: :collection
		post :user_identification, on: :collection
    post :question_of_the_day_ans, on: :collection
    post :question_leval_one_ans, on: :collection

		get :identify_yourself, on: :collection
    get :question_of_the_day, on: :collection
	end
 end



  namespace :bx_block_login do
	resources :logins
  end

  namespace :bx_block_forgot_password do
	resources :passwords
  end
  namespace :account_block do
       get 'user_current_location', to: 'accounts#user_current_location'
       get 'question_list', to: 'accounts#question_list'
   end
  namespace :bx_block_user_status do
    get 'account_user_status', to: 'user_status#account_user_status'
  end

  namespace :bx_block_time_clock do
    resources :questions
    resources :question_types
    resources :games
  end

  namespace :bx_block_ip_blocker do
    resources :ip_blockers
  end
end