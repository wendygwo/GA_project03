class Product < ActiveRecord::Base
  belongs_to :business

  has_attached_file :product_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :product_image, :less_than => 1.megabytes
end
