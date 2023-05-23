require 'rails_helper'

RSpec.describe BxBlockTimeClock::Question, type: :model do
  context "association test" do
    it "should belongs_to question_type" do
      t = BxBlockTimeClock::Question.reflect_on_association(:question_type)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
