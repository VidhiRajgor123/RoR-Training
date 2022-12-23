class Page < ApplicationRecord
    validates :title,:slug,:description, presence:true
end
