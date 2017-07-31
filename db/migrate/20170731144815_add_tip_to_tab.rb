class AddTipToTab < ActiveRecord::Migration[5.1]
  def change
  	add_column :tabs, :tip, :integer
  end
end
