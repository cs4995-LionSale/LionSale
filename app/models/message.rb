class Message < ApplicationRecord
  belongs_to :from, class_name: 'User', foreign_key: 'from_id'
  belongs_to :to, class_name: 'User', foreign_key: 'to_id'
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'
  has_many_attached :attachments
end
