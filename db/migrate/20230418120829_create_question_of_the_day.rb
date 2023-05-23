class CreateQuestionOfTheDay < ActiveRecord::Migration[6.0]
  def change
    create_table :question_of_the_days do |t|
       t.datetime :date
       t.string :question
       t.string :option_1
       t.string :option_2
       t.string :correct_answer
      t.timestamps
    end
  end
end
