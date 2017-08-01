class AddLimitColumnToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :limit_amount, :integer
    add_column :customers, :limit_cost, :integer
  end
end
