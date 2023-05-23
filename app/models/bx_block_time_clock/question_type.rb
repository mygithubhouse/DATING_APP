module BxBlockTimeClock
  class QuestionType < BxBlockTimeClock::ApplicationRecord
    has_many :questions
  end
end
