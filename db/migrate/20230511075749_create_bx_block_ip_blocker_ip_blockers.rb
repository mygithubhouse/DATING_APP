class CreateBxBlockIpBlockerIpBlockers < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_ip_blocker_ip_blockers do |t|
      t.string :ip_address
      t.boolean :valid_ip
      t.integer :account_id

      t.timestamps
    end
  end
end
