class RenameItemColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :type, :drink_type
  end
end
