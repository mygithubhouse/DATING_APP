module BxBlockTimeClock
  class QuestionsController < ApplicationController
    before_action :validate_json_web_token, except: [:index]

    def index
      questions = Question.all
      render json: QuestionSerializer.new(questions).serializable_hash, status: :ok
    end
  end
end
