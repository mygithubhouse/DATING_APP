class CreateBxBlockTimeClockQuestionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_time_clock_question_types do |t|
      t.string :type_name
      t.timestamps
    end
  end
end
