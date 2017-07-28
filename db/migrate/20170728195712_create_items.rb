class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :type
      t.integer :price # price is in cents
      t.references :tab, foreign_key: true

      t.timestamps
    end
  end
end
