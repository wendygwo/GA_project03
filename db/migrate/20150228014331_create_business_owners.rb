class CreateBusinessOwners < ActiveRecord::Migration
  def change
    create_table :business_owners do |t|
      t.belongs_to :business, index: true
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end
    add_foreign_key :business_owners, :businesses
    add_foreign_key :business_owners, :owners
  end
end
