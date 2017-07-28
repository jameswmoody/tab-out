class Item < ApplicationRecord
  belongs_to :tab
  validates :price, :tab_id, presence: true
  # validates tab_id points to a real tab
end
