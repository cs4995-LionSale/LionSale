class Message < ApplicationRecord
  belongs_to :from
  belongs_to :to
  belongs_to :item
end