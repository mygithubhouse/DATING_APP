class CreateIdentifyYourselves < ActiveRecord::Migration[6.0]
  def change
    create_table :identify_yourselves do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5
      t.timestamps
    end
  end
end
