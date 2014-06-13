json.array!(@products) do |product|
  json.extract! product, :id, :name, :price_in_cents, :quantity, :description, :category_id, :featured
  json.url product_url(product, format: :json)
end
