json.array!(@business_owners) do |business_owner|
  json.extract! business_owner, :id, :business_id, :owner_id
  json.url business_owner_url(business_owner, format: :json)
end
