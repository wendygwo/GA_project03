require 'bcrypt' #require bcrypt
class Owner < ActiveRecord::Base
	has_many :business_owners
  has_many :businesses, through: :business_owners
  has_secure_password #made available from the bcrypt gem

  # Validates e-mail for uniqueness and presence
  validates :email, uniqueness: true, presence: true, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i ,
multiline: true }

  # Validates presence of first and last name, and all address fields
  validates_presence_of :first_name, :last_name, :address_street, :address_city, :address_state, :address_zip
  # Validates that zip code is an integer, and that it is only 5 digits exactly long
  validates :address_zip, numericality: { only_integer: true }, format: {with: /\A\d{5}\z/ }


end
