
#frozen_string_literal: true
require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers
RSpec.describe Admin::IdentifyYourselfQuestionsController, type: :controller do
  render_views
  before(:each) do
    @admin = AdminUser.find_or_create_by(email: 'admin@yopmail.com')
    @admin.password = "password"
    @admin.save
    sign_in @admin
    @question = BxBlockIdentifyYourself::IdentifyYourself.find_or_create_by(question: "dbstructure",option1: "one",
      option2: "two",option3: "three",option4: "four",option5: "five")
    @question.save(validate: false)
  end

  describe "question#new" do
    let(:params) do {
      question: "dbstructure",
      option1: "one",
      option2: "two",
      option3: "three",
      option4: "four",
      option5: "five"

    }
    end
    it "create question" do
      post :new, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe "question#index" do
    it "show all question" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "question#show" do
    it "show particular question" do
      get :show, params: {id: @question.id}
      expect(response).to have_http_status(200)
    end
  end
  it 'returns success if request format is CSV' do
    get :index, format: :csv
    expect(response).to have_http_status(:success)
    expect(response.header['Content-Type']).to include 'text/csv'
  end
end
