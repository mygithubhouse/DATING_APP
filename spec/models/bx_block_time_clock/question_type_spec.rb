require 'rails_helper'

RSpec.describe BxBlockTimeClock::QuestionType, type: :model do
  context "association test" do
    it "should has_many questions" do
      t = BxBlockTimeClock::QuestionType.reflect_on_association(:questions)
      expect(t.macro).to eq(:has_many)
    end
  end
end
