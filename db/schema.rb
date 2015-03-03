# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150303062721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_owners", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_owners", ["business_id"], name: "index_business_owners_on_business_id", using: :btree
  add_index "business_owners", ["owner_id"], name: "index_business_owners_on_owner_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.integer  "address_zip"
    t.string   "phone_number"
    t.string   "website_url"
    t.string   "description"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "google_plus_link"
    t.string   "pinterest_link"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "biz_image_file_name"
    t.string   "biz_image_content_type"
    t.integer  "biz_image_file_size"
    t.datetime "biz_image_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.integer  "address_zip"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.string   "description"
    t.integer  "business_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "product_image_file_name"
    t.string   "product_image_content_type"
    t.integer  "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.integer  "category_id"
  end

  add_index "products", ["business_id"], name: "index_products_on_business_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  add_foreign_key "business_owners", "businesses"
  add_foreign_key "business_owners", "owners"
  add_foreign_key "products", "businesses"
  add_foreign_key "products", "categories"
end
