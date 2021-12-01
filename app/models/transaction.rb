class Transaction < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  has_many :seller_checkins, class_name: 'Checkin', inverse_of: 'transcation', foreign_key: 'transaction_id'
  has_many :buyer_checkins, class_name: 'Checkin', inverse_of: 'transcation', foreign_key: 'transaction_id'

  validate :valid_update_range?

  def valid_update_range?
    return unless self.created_at != nil && self.updated_at != nil
    return self.updated_at - self.created_at >= 0
  end

  def as_json(options={})
    super(
      only: [:id, :seller_id, :buyer_id, :item_id],
      include: { seller_checkins: { only: [:lat, :lng, :created_at] }, buyer_checkins: { only: [:lat, :lng, :created_at] }}
    )
  end
end
