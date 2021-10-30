class Message < ApplicationRecord
  belongs_to :sender_id
  belongs_to :to_id
  belongs_to :item_id
end
