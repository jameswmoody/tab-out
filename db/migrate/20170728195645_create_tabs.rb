class CreateTabs < ActiveRecord::Migration[5.1]
  def change
    create_table :tabs do |t|
      t.references :customer, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
