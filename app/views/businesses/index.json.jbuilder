json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :email, :address_street, :address_city, :address_state, :address_zip, :phone_number, :website_url, :description, :facebook_link, :twitter_link, :google_plus_link, :pinterest_link, :latitude, :longitude, :products
  json.url business_url(business, format: :json)
end
