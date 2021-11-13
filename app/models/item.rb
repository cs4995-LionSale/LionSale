class Item < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  validates :seller_id, presence: true
  default_scope -> { order(created_at: :desc) } 
  mount_uploader :picture, PictureUploader 
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  has_many :related_messages, class_name: 'Message', inverse_of: 'item'
  has_many :transactions, class_name: 'Transaction', inverse_of: 'item'
  has_many_attached :photos
  validates :seller_id, presence: true 
  validates :category_id, presence: true 
  validates :title, presence: true, length: { maximum: 32 } 
  validates :description, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validate  :picture_size 
  
  private
 # 验证上传的图片大小 
    def picture_size 
      if picture.size > 5.megabytes 
        errors.add(:picture, "should be less than 5MB") 
      end 
    end 
end