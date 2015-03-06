require 'rails_helper'

RSpec.describe Business, type: :model do
	#Checks presence of required business fields
  it { should validate_presence_of(:name) }
	it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address_street) }
  it { should validate_presence_of(:address_city) }
  it { should validate_presence_of(:address_state) }
  it { should validate_presence_of(:address_zip) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:description) }
  # Checks address zip must be a number
  it { should validate_numericality_of(:address_zip) }
  # Checks length of address zip must be 5 digits long
  it { should allow_value(90249).for(:address_zip)}
  it { should_not allow_value(9024).for(:address_zip)}
  # Checks format of e-mail
  it { should allow_value('john@john.com').for(:email)}
  it { should_not allow_value('john@john@.com').for(:email)}

end
