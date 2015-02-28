class BusinessOwner < ActiveRecord::Base
  belongs_to :business
  belongs_to :owner
end
