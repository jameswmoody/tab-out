class Customer < ApplicationRecord
  has_secure_password

  has_many :tabs

  validates :username, :phone, :first_name, :last_name, :email, presence: true
  validates :username, :phone, :email, uniqueness: true

end
