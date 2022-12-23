class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    attr_writer :remove_image
    has_many :carts
    has_many :order_items
    validates :name, :description, :price, :image, presence: true
    validates :price, length: {maximum: 7 }
    enum status: [:active, :inactive]

    def remove_image
        @remove_image || false
    end

    def before_remove_image
        if self.remove_image
          self.remove_image = nil
        end
    end
    
before_validation { self.image.clear if self.remove_image == '1' }
end
