require 'bcrypt' #require bcrypt
class Owner < ActiveRecord::Base
	has_many :business_owners
  has_many :businesses, through: :business_owners
  has_secure_password #made available from the bcrypt gem
end
