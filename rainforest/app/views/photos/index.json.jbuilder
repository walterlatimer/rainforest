json.array!(@photos) do |photo|
  json.extract! photo, :id, :url, :product_id
  json.url photo_url(photo, format: :json)
end
