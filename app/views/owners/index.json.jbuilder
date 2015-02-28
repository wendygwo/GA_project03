json.array!(@owners) do |owner|
  json.extract! owner, :id, :first_name, :last_name, :address_street, :address_city, :address_state, :address_zip, :phone_number, :email
  json.url owner_url(owner, format: :json)
end
