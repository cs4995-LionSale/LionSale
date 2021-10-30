class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :seller
  belongs_to :buyer
end
