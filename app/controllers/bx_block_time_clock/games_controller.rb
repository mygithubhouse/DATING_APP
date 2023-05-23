module BxBlockTimeClock
  class GamesController < ApplicationController
    before_action :get_game, only: :create

    def create
      game = Game.new(game_params)
      if game.save
      	render json: {message: "Game Started"},
          status: :created
      else
      	render json: {errors: game.errors.full_messages},
          status: :unprocessable_entity
      end
    end

    private

    def get_game  
    	@game = Game.where(account: game_params[:account_id], current_user_id: current_user.id, level_id: game_params[:level_id])
   		return render json: {errors: "Already stared"},
          status: :unprocessable_entity if @game.present?
    end

    def game_params
    	params.require(:game).permit(:account_id, :level_id).merge(
    		start_at: Time.now, 
    		end_at: (Time.now + 24.hours ),
    		current_user_id: current_user.id)
    end
  end
end
