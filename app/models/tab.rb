class Tab < ApplicationRecord
  belongs_to :customer
  belongs_to :business
  has_many :items, dependent: :destroy
  validates :customer_id, :business_id, presence: true
end
