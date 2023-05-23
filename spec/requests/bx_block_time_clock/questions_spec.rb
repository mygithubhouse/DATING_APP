require 'rails_helper'

RSpec.describe "BxBlockTimeClock::Questions", type: :request do
  describe "GET /index" do
    it "When get all questions" do
      get '/bx_block_time_clock/questions'
      expect(response).to have_http_status(200)
    end
  end
end
