class Transaction < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  validate :valid_update_range?

  def valid_update_range?
    return unless self.created_at != nil && self.updated_at != nil
    return self.updated_at - self.created_at >= 0
  end

  def seller_checkins
    Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.seller.id).limit(30)
  end

  def buyer_checkins
    Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.buyer.id).limit(30)
  end

  def seller_checkin_latest
    pos = Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.seller.id).order("created_at").last
    return [pos[:lat],pos[:lng]]
  end

  def buyer_checkin_latest
    pos = Checkin.where("transaction_id = ? AND user_id = ?",self.id,self.buyer.id).order("created_at").last
    return [pos[:lat],pos[:lng]]
  end

  def as_json(options={})
    super(
      only: [:id, :seller_id, :buyer_id, :item_id],
      include: { seller_checkins: { only: [:lat, :lng, :created_at] }, buyer_checkins: { only: [:lat, :lng, :created_at] }}
    )
  end
end
