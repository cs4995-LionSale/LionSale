class Transaction < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  validates :expected_deal_time, presence: true

  validate :valid_update_range?

  def valid_update_range?
    return self.expected_deal_time - Time.now >= 0
  end

  def seller_checkins
    Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.seller.id).order("created_at").limit(30)
  end

  def buyer_checkins
    Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.buyer.id).order("created_at").limit(30)
  end

  def seller_checkin_latest
    pos = Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.seller.id).order("created_at").last
    return pos ? [pos[:lat],pos[:lng]] : nil
  end

  def buyer_checkin_latest
    pos = Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.buyer.id).order("created_at").last
    return pos ? [pos[:lat],pos[:lng]] : nil
  end

  def as_json(options={})
    super(
      only: [:id, :seller_id, :buyer_id, :item_id],
      include: { seller_checkins: { only: [:lat, :lng, :created_at] }, buyer_checkins: { only: [:lat, :lng, :created_at] }}
    )
  end
end
