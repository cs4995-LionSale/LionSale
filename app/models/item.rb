class Item < ApplicationRecord
  belongs_to :seller_id
  belongs_to :category_id
end
