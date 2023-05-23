class AddColumnMediaToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :media, :boolean, default: false
  end
end
