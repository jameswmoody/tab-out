class AddLimitToTab < ActiveRecord::Migration[5.1]
  def change
    add_column :tabs, :limit, :integer

  end
end
