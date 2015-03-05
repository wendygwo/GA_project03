class Business < ActiveRecord::Base
	# geocoded_by :address_street   # can also be an IP address
	geocoded_by :full_address
	after_validation :geocode          # auto-fetch coordinates

	# The dependent destroy means any records associated with this business on the business_owners table will be destroyed if a business is destroyed
	# The owner record won't be destroyed though
	has_many :business_owners, dependent: :destroy
  has_many :owners, through: :business_owners

  has_many :products

  has_attached_file :biz_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :biz_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :biz_image, :less_than => 1.megabytes

  def full_address
  	"#{address_street}, #{address_city}, #{address_state} #{address_zip}"
  end


# Yelp added here
require 'json'

module Yelp
  module Endpoint
    class Business
      PATH = '/v2/business/'

      def initialize(client)
        @client = client
      end

      # Make a request to the business endpoint on the API
      #
      # @param id [String] the business id
      # @return [BurstStruct] the parsed response object from the API
      #
      # @example Get business
      #   business = client.business('yelp-san-francisco')
      #   business.name # => 'Yelp'
      #   buinesss.url  # => 'http://www.yelp.com/biz/yelp-san-francisco'
      def business(id)
        BurstStruct::Burst.new(JSON.parse(business_request(id).body))
      end

      private

      # Make a request to the business endpoint of the API
      # The endpoint requires a format of /v2/business/{business-id}
      # so the primary request parameter is concatenated. After getting
      # the response back it's checked to see if there are any API errors
      # and raises the relevant one if there is.
      #
      # @param id [String, Integer] the business id
      # @return [Faraday::Response] the raw response back from the connection
      def business_request(id)
        result = @client.connection.get PATH + id
        Error.check_for_error(result)
        result
      end
    end
  end
end

end
