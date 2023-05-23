require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
RSpec.describe Admin::QuestionOfTheDaysController, type: :controller do
  render_views
  before(:each) do
    @admin = AdminUser.find_or_create_by(email: 'admin@example.com')
    @admin.password = "password"
    @admin.save
    sign_in @admin
    @question = BxBlockQuestionsOfTheDays::QuestionOfTheDay.find_or_create_by(question: "two",option_1: "one",
      option_2: "two")
    @question.save(validate: false)
  end

  describe "question_of_the_day#new" do
    let(:params) do {
      question: "dbstructure",
      option_1: "one",
      option_2: "two"

    }
    end
    it "create question_of_the_day" do
      post :new, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe "question_of_the_day#index" do
    it "show all question" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "question_of_the_day#show" do
    it "show particular question" do
      get :show, params: {id: @question.id}
      expect(response).to have_http_status(200)
    end
  end
end
