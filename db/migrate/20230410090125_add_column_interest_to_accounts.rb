class AddColumnInterestToAccounts < ActiveRecord::Migration[6.0]
  def change
  	add_column :accounts, :interest, :integer
  end
end
