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
  validates :description, presence: true, length: { maximum: 65535 }
  validates :price, presence: true
  
  
  def change_stock(quantity)
    if (stock == 0) #in that case number should be positive to add stock, and status should be set to allow sell
      status = 0
    end  
    stock += quantity
    if (stock == 0) # change status of item if out of stock
      status = 20
    end

    save()
  end
end