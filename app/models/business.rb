class Business < ActiveRecord::Base
	# The dependent destroy means any records associated with this business on the business_owners table will be destroyed if a business is destroyed
	# The owner record won't be destroyed though
	has_many :business_owners, dependent: :destroy
  has_many :owners, through: :business_owners

  has_many :products

  has_attached_file :biz_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :biz_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :biz_image, :less_than => 1.megabytes
end
