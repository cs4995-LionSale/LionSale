class Transaction < ApplicationRecord
  belongs_to :item_id
  belongs_to :seller_id
  belongs_to :buyer_id
end
