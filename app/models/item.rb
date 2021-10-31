class Item < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  has_many :related_messages, class_name: 'Message', inverse_of: 'item'
  has_many :transactions, class_name: 'Transaction', inverse_of: 'item'
  has_many_attached :photos
end
