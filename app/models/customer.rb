class Customer < ApplicationRecord
  has_secure_password
  has_many :tabs
  validates :username, :phone_number, :first_name, :last_name, :email, presence: true
  validates :username, :phone_number, :email, uniqueness: true
end
