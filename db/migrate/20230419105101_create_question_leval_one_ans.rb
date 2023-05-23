class CreateQuestionLevalOneAns < ActiveRecord::Migration[6.0]
  def change
    create_table :question_leval_one_answers do |t|
      t.integer :account_id
      t.integer :question_leval_one_id
      t.string :correct_answer
      t.timestamps
    end
  end
end
