json.extract! transaction, :id, :item_id_id, :seller_id_id, :buyer_id_id, :created_at, :updated_at, :expected_deal_time, :real_deal_time, :deal_address, :deal_price, :status, :seller_rating, :buyer_rating, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
