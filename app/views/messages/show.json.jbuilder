json.content @message.content
json.(@message, :created_at)

json.from do
  json.from_id @message.from.id
  json.username @message.from.username
  json.email @message.from.email
  json.url url_for(@message.from)
  if @message.from.avatar.attached?
    json.avatar_url url_for(@message.from.avatar)
  end
end

json.to do
  json.to_id @message.to.id
  json.username @message.to.username
  json.email @message.to.email
  json.url url_for(@message.to)
  if @message.to.avatar.attached?
    json.avatar_url url_for(@message.to.avatar)
  end
end

json.item do
  json.item_id @message.item.id
end

json.attachments @message.attachments do |attachment|
  json.url url_for(attachment)
end