class CreateBxBlockTimeClockGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :level, index: :true
      t.datetime :start_at
      t.datetime :end_at
      t.references :account, index: :true
      t.integer :current_user_id
      t.timestamps
    end
  end
end
