json.extract! transaction, :id, :item_id, :seller_id, :buyer_id, :expected_deal_time, :real_deal_time, :deal_address, :deal_price, :status, :seller_rating, :buyer_rating, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
