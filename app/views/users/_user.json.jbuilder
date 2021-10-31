json.extract! user, :id, :email, :username, :password_digest, :address, :rating_seller, :rating_buyer, :permission, :created_at, :updated_at
json.url user_url(user, format: :json)
