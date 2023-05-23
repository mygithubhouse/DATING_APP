require 'rails_helper'

RSpec.describe BxBlockTimeClock::Game, type: :model do
  context "association test" do
    it "should belongs_to account" do
      t = BxBlockTimeClock::Game.reflect_on_association(:account)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should belongs_to level" do
      t = BxBlockTimeClock::Game.reflect_on_association(:level)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
