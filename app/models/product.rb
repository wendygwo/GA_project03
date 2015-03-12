class Product < ActiveRecord::Base
  belongs_to :business
  belongs_to :category

  # # Added for search
  # searchkick word_middle: [:name, :description]

  # Validates presence of all product fields
  validates_presence_of :name, :quantity, :price, :description, :product_image, :category_id

  has_attached_file :product_image, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :product_image, :less_than => 1.megabytes
end
