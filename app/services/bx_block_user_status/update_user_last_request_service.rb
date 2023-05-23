module BxBlockUserStatus
  class UpdateUserLastRequestService
    class << self
      def call(account_id)
        status = UserStatus.find_or_create_by(account_id: account_id)

        status.touch(:last_request_at, :updated_at) if status&.valid?
      end
    end
  end
end
