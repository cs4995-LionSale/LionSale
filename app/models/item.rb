class Item < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  has_many_attached :photos
end
