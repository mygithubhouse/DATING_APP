class AddColumnLocationToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :location, :boolean, default: false
  end
end
