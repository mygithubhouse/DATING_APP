module BxBlockTimeClock
  class Question < BxBlockTimeClock::ApplicationRecord
    self.table_name = "bx_block_time_clock_questions"
    belongs_to :question_type
  end
end