class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :messgaes_sent, class_name: 'Message', inverse_of: 'from'
    has_many :messgaes_received, class_name: 'Message', inverse_of: 'to'
    has_many :transactions_as_seller, class_name: 'Transaction', inverse_of: 'seller'
    has_many :transactions_as_buyer, class_name: 'Transaction', inverse_of: 'buyer'
    has_many :items_sold, class_name: 'Iten', inverse_of: 'seller'
end
