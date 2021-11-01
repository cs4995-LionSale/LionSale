json.extract! item, :id, :title, :description, :seller_id, :price, :status, :category_id, :number, :created_at, :updated_at
json.url item_url(item, format: :json)
