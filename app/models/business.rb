require_relative 'business_customer_validator'

class Business < ApplicationRecord
  has_many :tabs
  has_secure_password
  validates :username, :sub_merchant_id, :email, uniqueness: true, presence: true
  validates :doing_business_as, presence: true
  validates_with BusinessCustomerValidator

  def dba # For ease of access to the business' name
    self.doing_business_as
  end

  def search(search_term)
    self.open_tabs.select{ |tab| tab.customer.last_name.downcase == search_term.downcase || tab.customer.username.downcase == search_term.downcase || tab.customer.first_name.downcase == search_term.downcase }
  end

  def open_tabs
    self.tabs.order("updated_at DESC").select{ |tab| tab.is_open? }
  end

  def closed_tabs
    self.tabs.order("updated_at DESC").select{ |tab| !tab.is_open? }
  end
end
