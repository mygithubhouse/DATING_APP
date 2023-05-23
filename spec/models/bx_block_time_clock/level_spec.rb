require 'rails_helper'

RSpec.describe BxBlockTimeClock::Level, type: :model do
  context "association test" do
    it "should has_many question_type" do
      t = BxBlockTimeClock::Level.reflect_on_association(:question_leval_ones)
      expect(t.macro).to eq(:has_many)
    end

    it "should has_many games" do
      t = BxBlockTimeClock::Level.reflect_on_association(:games)
      expect(t.macro).to eq(:has_many)
    end
  end
end
