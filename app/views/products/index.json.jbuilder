json.array!(@products) do |product|
  json.extract! product, :id, :name, :quantity, :price, :description, :category, :business_id
  json.url product_url(product, format: :json)
end
