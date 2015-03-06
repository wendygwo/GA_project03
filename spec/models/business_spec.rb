require 'rails_helper'

RSpec.describe Business, type: :model do
  # Check presence of all fields except social media links and website
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

  it { should validate_length_of(:email).is_at_most(50) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:description).is_at_most(500) }

  #Checks format of e-mail field
  it { should allow_value('john@john.com').for(:email)}
  it { should_not allow_value('john@jo@hn.com').for(:email)}
end
