json.content @message.content
json.(@message, :created_at)

json.from do
  json.username @message.from.username
  json.email @message.from.email
  json.url url_for(@message.from)
  json.avatar_url url_for(@message.from.avatar)
end

json.to do
    json.username @message.to.username
    json.email @message.to.email
    json.url url_for(@message.to)
    json.avatar_url url_for(@message.to.avatar)
end

json.attachments @message.attachments do |attachment|
  json.url url_for(attachment)
end