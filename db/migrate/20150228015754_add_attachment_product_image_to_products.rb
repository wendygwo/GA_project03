class AddAttachmentProductImageToProducts < ActiveRecord::Migration

	def self.up
	  add_attachment :products, :product_image
	end

  def self.down
    remove_attachment :products, :product_image
  end
end
