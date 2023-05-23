class CreateUserIdentifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_identifications do |t|
      t.integer :account_id
      t.integer :identify_yourself_id
      t.string :correct_answer, array: true, default: [], using: "(array_to_string(correct_answer,','))"
      t.timestamps
    end
  end
end
