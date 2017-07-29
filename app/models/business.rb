class Business < ApplicationRecord
  has_many :tabs
  has_secure_password
  validates :username, :sub_merchant_id, :email, uniqueness: true, presence: true
  validates :doing_business_as, presence: true

  def dba # For ease of access to the business' name
    self.doing_business_as
  end
  def search(search_term)
    self.tabs.select{ |tab| tab.customer.last_name.downcase == search_term.downcase || tab.customer.username.downcase == search_term.downcase || tab.customer.first_name.downcase == search_term.downcase }
  end
end
