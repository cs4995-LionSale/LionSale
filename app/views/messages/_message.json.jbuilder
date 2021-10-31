json.extract! message, :id, :from_id, :to_id, :item_id, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
