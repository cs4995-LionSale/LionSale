class Item < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  validates :seller_id, presence: true
  default_scope -> { order(created_at: :desc) } 
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  has_many :related_messages, class_name: 'Message', inverse_of: 'item', foreign_key: 'item_id'
  has_many :transactions, class_name: 'Transaction', inverse_of: 'item', foreign_key: 'item_id'
  has_many_attached :photos
  validates :seller_id, presence: true 
  validates :category_id, presence: true 
  validates :title, presence: true, length: { maximum: 255 } 
  validates :description, length: { maximum: 65535 }
  validates :price, presence: true
  
  def change_stock(quantity, stage)
    if stage == 0  # create transaction stage 
      if self.stock + quantity == 0
        self.status = 10
      end
      self.stock += quantity
    else  
      # confirm transaction stage, since transaction's stock has been decreased at creat stage,
      # at current stage, just check if the remain item stock is non negative, if not, the transaction
      # can not be finished and its quantity should be returned to item stock
      if self.stock == 0
        self.status = 20
      elsif self.stock < 0  
        # this occurs when other buyer create transaction at the same time and finishes earlier
        # the current transaction can not be finished, the quantity should be returned to stock
        self.stock -= quantity
        self.status = self.stock > 0 ? 0 : 20
        self.save
        return false
      end     
    end

    return self.save
  end
end