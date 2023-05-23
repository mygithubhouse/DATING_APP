class RenameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :question_leval_ones, :cheack, :correct_answer
  end
end
