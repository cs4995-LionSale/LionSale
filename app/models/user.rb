class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :messgaes_sent, class_name: 'Message', inverse_of: 'from'
    has_many :messgaes_received, class_name: 'Message', inverse_of: 'to'
    has_many :items_sold, class_name: 'Item', inverse_of: 'seller'
    has_many :items_bought, class_name: 'Item', inverse_of: 'buyer'
end
