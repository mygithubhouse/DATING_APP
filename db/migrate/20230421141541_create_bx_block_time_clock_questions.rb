class CreateBxBlockTimeClockQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_time_clock_questions do |t|
      t.string :question_text
      t.references :question_type, index: true
      t.timestamps
    end
  end
end
