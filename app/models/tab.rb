class Tab < ApplicationRecord
  belongs_to :customer
  belongs_to :business
  has_many :items, dependent: :destroy
  validates :customer_id, :business_id, presence: true

  def total_price
    sub = self.items.reduce(0) { |total, item| total + item.price }
  end

  def is_open?
    self.transaction_id == nil
  end
end
