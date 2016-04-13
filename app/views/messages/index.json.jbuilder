json.array!(@messages) do |message|
  json.extract! message, :id, :bike_id, :body
  json.url message_url(message, format: :json)
end
