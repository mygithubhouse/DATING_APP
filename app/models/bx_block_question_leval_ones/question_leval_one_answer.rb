module BxBlockQuestionLevalOnes
	class QuestionLevalOneAnswer < ApplicationRecord
		self.table_name = :question_leval_one_answers
    belongs_to :account, class_name: "AccountBlock::Account", foreign_key: "account_id"
    belongs_to :question_leval_one, foreign_key: "question_leval_one_id"
	end
end