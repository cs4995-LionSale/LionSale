class User < ApplicationRecord
    attr_accessor :remember_token 
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: { maximum: 255 }
     VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)\z/

     validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


    has_one_attached :avatar

    has_many :messgaes_sent, class_name: 'Message', inverse_of: 'from', foreign_key: 'from_id'
    has_many :messgaes_received, class_name: 'Message', inverse_of: 'to', foreign_key: 'to_id'

    has_many :transactions_as_seller, class_name: 'Transaction', inverse_of: 'seller', foreign_key: 'seller_id'
    has_many :transactions_as_buyer, class_name: 'Transaction', inverse_of: 'buyer', foreign_key: 'buyer_id'
    has_many :items_sold, class_name: 'Item', inverse_of: 'seller', foreign_key: 'seller_id', dependent: :destroy
    def items_sold_num 
      count = 0
      return items_sold.where(status:20).count
    end
    def items_selling_num 
      count = 0
      return items_sold.where(status:0).count
    end
    def items_bought_num 
      return transactions_as_buyer.count
    end

    #return target string's hash
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost 
      BCrypt::Password.create(string, cost: cost)  
    end

    #return a random token
    def User.new_token
      SecureRandom.urlsafe_base64  
    end

    #remember user in db for long session
    def remember
      self.remember_token = User.new_token 
      update_attribute(:remember_digest, User.digest(remember_token))  
    end

    #if target token matches digest, return true
    def authenticated?(remember_token)
      if remember_digest.nil?
        false
      else
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end
    end
    
    #forget current user
    def forget
      update_attribute(:remember_digest, nil)  
    end

end
