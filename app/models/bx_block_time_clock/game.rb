module BxBlockTimeClock
  class Game < BxBlockTimeClock::ApplicationRecord
    self.table_name = "games"
    belongs_to :account, class_name: "AccountBlock::Account"
    belongs_to :level
  end
end