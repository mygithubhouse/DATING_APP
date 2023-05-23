class CreateQuestionLevalOne < ActiveRecord::Migration[6.0]
  def change
    create_table :question_leval_ones do |t|
       t.string :question
       t.string :option_1
       t.string :option_2
       t.string :cheack
      t.timestamps
    end
  end
end
