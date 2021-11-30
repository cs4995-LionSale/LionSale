class Transaction < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  validates :expected_deal_time, presence: true
  validate :valid_update_range?

  def valid_update_range?
    return self.expected_deal_time - Time.now >= 0
  end
end
