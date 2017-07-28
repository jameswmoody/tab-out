class Customer < ApplicationRecord
  has_many :tabs
  has_secure_password

  validates :username, :phone, :first_name, :last_name, :email, presence: true
  validates :username, :phone, :email, uniqueness: true

end
