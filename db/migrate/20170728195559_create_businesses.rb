class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :username
      t.string :password_digest
      t.string :sub_merchant_id
      t.string :email
      t.string :doing_business_as

      t.timestamps
    end
  end
end
