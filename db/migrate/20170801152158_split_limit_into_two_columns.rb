class SplitLimitIntoTwoColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :tabs, :limit_amount, :integer, default: 0
    add_column :tabs, :limit_cost, :integer, default: 0
    remove_column :tabs, :limit
  end
end
