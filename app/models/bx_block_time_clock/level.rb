module BxBlockTimeClock
  class Level < BxBlockTimeClock::ApplicationRecord
    self.table_name = "levels"
    has_many :question_leval_ones, class_name: "BxBlockQuestionLevalOnes::QuestionLevalOne", dependent: :destroy
    has_many :games, dependent: :destroy
  end
end