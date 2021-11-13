class Item < ApplicationRecord
  belongs_to :seller 
  validates :seller_id, presence: true
  default_scope -> { order(created_at: :desc) } 
  mount_uploader :picture, PictureUploader 
  belongs_to :category
  validates :seller_id, presence: true 
  validates :category_id, presence: true 
  validates :title, presence: true, length: { max: 32}
  validates :description, presence: true, length: { max: 255 }
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
