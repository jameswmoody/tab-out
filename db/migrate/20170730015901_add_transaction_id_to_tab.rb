class AddTransactionIdToTab < ActiveRecord::Migration[5.1]
  def change
  	add_column :tabs, :transaction_id, :string
  end
end
