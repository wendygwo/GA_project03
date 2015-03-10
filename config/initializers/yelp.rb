require 'yelp'

Yelp.client.configure do |yelp|
  yelp.consumer_key = ENV["yelp_consumer_key"]
  yelp.consumer_secret = ENV["yelp_consumer_secret"]
  yelp.token = ENV["yelp_token"]
  yelp.token_secret = ENV["yelp_token_secret"]
end
