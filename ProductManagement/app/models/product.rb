class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :carts
    has_many :order_items
    validates :name, :description, :price, :image, presence: true
    validates :price, length: {maximum: 7 }
    enum status: [:active, :inactive]
end
