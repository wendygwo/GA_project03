class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.integer :address_zip
      t.string :phone_number
      t.string :website_url
      t.string :description
      t.string :facebook_link
      t.string :twitter_link
      t.string :google_plus_link
      t.string :pinterest_link
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
