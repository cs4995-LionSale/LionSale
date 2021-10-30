json.extract! photo, :id, :photo_url, :item_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
