class AddLevelIdInOneLevelQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :question_leval_ones, :level, index: true
  end
end
