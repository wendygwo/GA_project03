class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.string :description
      t.string :category
      t.belongs_to :business, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :businesses
  end
end
