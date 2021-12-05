class Checkin < ApplicationRecord
  after_create :notify_pusher
  belongs_to :associated_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :associated_user, class_name: 'User', foreign_key: 'user_id'

  def notify_pusher
    Pusher.trigger('location', 'new', self.associated_transaction.as_json)
  end
end
