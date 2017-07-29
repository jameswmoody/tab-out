class Item < ApplicationRecord
  belongs_to :tab
  validates :price, :tab_id, presence: true

end
