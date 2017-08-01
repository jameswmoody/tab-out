class Tab < ApplicationRecord
  belongs_to :customer
  belongs_to :business
  has_many :items, dependent: :destroy
  validates :customer_id, :business_id, presence: true
  # validate :customer_one_open_tab_at_bar

  def total_price
    sub = self.items.reduce(0) { |total, item| total + item.price }
  end

  def is_open?
    self.transaction_id == nil
  end

  # def customer_one_open_tab_at_bar
  #   business = self.business
  #   match = business.tabs.find_by(business_id: self.business_id, customer_id: self.customer_id)
  #   p match.is_open?
  #   if match && match.is_open?
  #     errors.add(:unique, "You already have an open tab with this bar")
  #   end
  # end
end
