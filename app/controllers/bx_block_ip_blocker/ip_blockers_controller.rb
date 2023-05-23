module BxBlockIpBlocker
    class IpBlockersController < ApplicationController
        def create
         ip_blocker = IpBlocker.new(ip_blocker_params)
            if ip_blocker.save
                render json: {message: "ip_blocker created"},
                status: :created
            else
                render json: {errors: ip_blocker.errors.full_messages},
                status: :unprocessable_entity
            end
        end

        private

        def ip_blocker_params
    	    params.require(:ip_blocker).permit(:ip_address, :valid_ip, :account_id)
        end
    end
end

