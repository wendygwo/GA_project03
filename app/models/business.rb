class Business < ActiveRecord::Base
	# geocoded_by :address_street   # can also be an IP address
	geocoded_by :full_address
	after_validation :geocode          # auto-fetch coordinates

	# The dependent destroy means any records associated with this business on the business_owners table will be destroyed if a business is destroyed
	# The owner record won't be destroyed though
	has_many :business_owners, dependent: :destroy
  has_many :owners, through: :business_owners

  has_many :products

  has_attached_file :biz_image, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :biz_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :biz_image, :less_than => 1.megabytes

  ############################################################
  ############### Start form field validations ###############
  ############################################################

  # Validates presence of first and last name, and all address fields
  validates_presence_of :name, :email, :address_street, :address_city, :address_state, :address_zip, :phone_number, :description

  # Validates that zip code is an integer, and that it is only 5 digits exactly long
  validates :address_zip, numericality: { only_integer: true }, format: {with: /\A\d{5}\z/ }

  # Validates length of e-mail, first name, and last name
  validates_length_of :email, :name, maximum: 50
  validates_length_of :description, maximum: 500

 # Validates e-mail for uniqueness and presence
  validates :email, uniqueness: true, presence: true, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , multiline: true }

  ##########################################################
  ############### End form field validations ###############
  ##########################################################


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
