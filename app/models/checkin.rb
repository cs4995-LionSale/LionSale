class Checkin < ApplicationRecord
  after_create :notify_pusher
  belongs_to :transcation, class_name: 'Transaction', foreign_key: 'transaction_id'

  def notify_pusher
    Pusher.trigger('location', 'new', self.transcation.as_json)
  end
end
