class User < ApplicationRecord
    attr_accessor :remember_token 
    before_save { self.email = email.downcase }
    validates :username, presence: true
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 } 


    has_one_attached :avatar
    has_many :messgaes_sent, class_name: 'Message', inverse_of: 'from'
    has_many :messgaes_received, class_name: 'Message', inverse_of: 'to'
    has_many :transactions_as_seller, class_name: 'Transaction', inverse_of: 'seller'
    has_many :transactions_as_buyer, class_name: 'Transaction', inverse_of: 'buyer'
    has_many :items_sold, class_name: 'Iten', inverse_of: 'seller'
    def items_sold_num 
        return 123
    end
    def items_selling_num 
        return 456
    end
    def items_bought_num 
        return 789
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
