class CreateQuestionOfTheDayAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :question_of_the_day_answers do |t|
      t.integer :account_id
      t.integer :question_of_the_day_id
      t.string :correct_answer
      t.timestamps
    end
  end
end
