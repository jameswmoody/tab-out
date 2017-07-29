class Item < ApplicationRecord
  belongs_to :tab
  validates :price, :tab_id, presence: true

  def price_in_dollars
    dollars = self.price/100
    '$' + dollars.to_s
  end
end
