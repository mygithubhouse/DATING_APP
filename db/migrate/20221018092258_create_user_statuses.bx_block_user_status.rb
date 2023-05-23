# This migration comes from bx_block_user_status (originally 20210312165622)
class CreateUserStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_statuses do |t|
      t.references :account, null: false, foreign_key: true
      t.timestamp :last_request_at
      t.timestamps
    end
  end
end
