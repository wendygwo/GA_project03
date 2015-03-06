require 'rails_helper'

RSpec.describe Owner, type: :model do
	#Checks presence of and uniqueness of e-mail field
  it { should validate_uniqueness_of(:email)}
  it { should validate_presence_of(:email) }

  #Checks format of e-mail field
  it { should allow_value('john@john.com').for(:email)}
  it { should_not allow_value('john@jo@hn.com').for(:email)}

  #Checks presence of first name and last name
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  # Checks validation of presence of address fields
  it { should validate_presence_of(:address_street) }
  it { should validate_presence_of(:address_city) }
  it { should validate_presence_of(:address_state) }
  it { should validate_presence_of(:address_zip) }

  # Checks address zip must be a number
  it { should validate_numericality_of(:address_zip) }
  # Checks length of address zip must be 5 digits long
  it { should allow_value(90249).for(:address_zip)}
  it { should_not allow_value(9024).for(:address_zip)}

  it { should validate_length_of(:email).is_at_most(50) }
  it { should validate_length_of(:first_name).is_at_most(50) }
  it { should validate_length_of(:last_name).is_at_most(50) }
end
