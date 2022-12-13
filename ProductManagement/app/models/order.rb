class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :total_amount, presence: true
  validates :total_qty, presence: true
  validates :name, presence: true
  validates :mobile, presence: true
  validates :address, presence: true
end
