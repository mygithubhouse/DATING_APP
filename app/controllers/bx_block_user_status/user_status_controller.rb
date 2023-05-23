module BxBlockUserStatus
  class UserStatusController < ApplicationController
    def index
      statuses = BxBlockUserStatus::UserStatus.where(account_id: Array(params[:account_ids]))
                   .pluck(:account_id, :last_request_at).to_h

      render json: {
        data: {
          account_status: format_statuses(statuses)
        }
      }
    end

    private

    def format_statuses(statuses)
      Array(params[:account_ids]).map do |account_id|
        last_request = statuses[account_id.to_i]
        {
          account_id: account_id.to_i,
          status: if last_request && (last_request > (Time.zone.now - 5.minutes))
                    'online'
                  else
                    'offline'
                  end
        }
      end
    end
  end
end
