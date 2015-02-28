class Business < ActiveRecord::Base
	has_many :business_owners
  has_many :owners, through: :business_owners

  has_many :products

  has_attached_file :biz_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :biz_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :biz_image, :less_than => 1.megabytes
end
