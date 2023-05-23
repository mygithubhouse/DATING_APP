module BxBlockUserStatus
  class ApplicationController < BuilderBase::ApplicationController
    # protect_from_forgery with: :exception
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  end
end
