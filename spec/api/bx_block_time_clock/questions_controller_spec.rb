require 'rails_helper'
require 'spec_helper'

RSpec.describe BxBlockTimeClock::QuestionsController, type: :controller do
  describe "GET /index" do
    it "get all questions" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
