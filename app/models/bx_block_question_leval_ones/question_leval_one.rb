module BxBlockQuestionLevalOnes
	class QuestionLevalOne < ApplicationRecord
		self.table_name = :question_leval_ones
		belongs_to :level, class_name: "BxBlockTimeClock::Level"
	end
end