module BxBlockUserStatus
  module PatchTokenValidationToUpdateUserLastRequest
    def validate_json_web_token
      super

      BxBlockUserStatus::UpdateUserLastRequestService.call(@token.id) if @token
    end
  end
end
