json.extract! message, :id, :from_id, :to_id, :item_id, :created_at, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
