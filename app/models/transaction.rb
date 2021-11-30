class Transaction < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  validates :created_at, presence: true
  #validates :updated_at, presence: true
  validate :valid_update_range?

  def valid_update_range?
    return unless self.created_at != nil && self.updated_at != nil
    return self.updated_at - self.created_at >= 0
  end
end
