require_relative 'customer_business_validator'

class Customer < ApplicationRecord
  has_secure_password

  has_many :tabs

  validates :username, :phone, :first_name, :last_name, :email, presence: true
  validates :username, :phone, :email, uniqueness: true
  validates :phone, format: {with: /[+][1]\d{10}/, message: "only allows the [+1xxxxxxxxxx] format"}
  validates_with CustomerBusinessValidator

  def open_tabs
    self.tabs.order("updated_at DESC").select{ |tab| tab.is_open? }
  end

  def closed_tabs
    self.tabs.order("updated_at DESC").select{ |tab| !tab.is_open? }
  end
end
