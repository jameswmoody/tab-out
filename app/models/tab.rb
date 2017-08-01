class Tab < ApplicationRecord
  belongs_to :customer
  belongs_to :business
  has_many :items, dependent: :destroy
  validates :customer_id, :business_id, presence: true
  validate :customer_one_open_tab_at_bar

  def total_price
    sub = self.items.reduce(0) { |total, item| total + item.price }
  end

  def is_open?
    self.transaction_id == nil
  end

  def customer_one_open_tab_at_bar
    business = self.business
    open = business.open_tabs
    if open.include(self)
      errors.add(:unique, "You already have an open tab with this bar")
    end
  end
end
