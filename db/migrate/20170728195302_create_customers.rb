class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password_digest
      t.string :vault_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
