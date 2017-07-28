class Customer < ApplicationRecord
  has_many :tabs
  has_secure_password
  validates :username, :phone_number, :first_name, :last_name, :email, presence: true
  validates :username, :phone_number, :email, uniqueness: true
end
