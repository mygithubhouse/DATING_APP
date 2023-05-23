module BxBlockQuestionsOfTheDays
	class QuestionOfTheDay < ApplicationRecord
	 self.table_name = :question_of_the_days
	 before_create :ensure_unique_date
	  def ensure_unique_date
	    if BxBlockQuestionsOfTheDays::QuestionOfTheDay.exists?(date: self.date)
	      errors.add(:date, 'must be unique')
	      throw(:abort)
	    end
	  end
	end
end
