class AddAttachmentBizImageToBusinesses < ActiveRecord::Migration
	def self.up
	  add_attachment :businesses, :biz_image
	end

  def self.down
    remove_attachment :businesses, :biz_image
  end
end
