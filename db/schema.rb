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

ActiveRecord::Schema.define(version: 20170730015901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "sub_merchant_id"
    t.string "email"
    t.string "doing_business_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "vault_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "drink_type"
    t.integer "price"
    t.bigint "tab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tab_id"], name: "index_items_on_tab_id"
  end

  create_table "tabs", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_id"
    t.index ["business_id"], name: "index_tabs_on_business_id"
    t.index ["customer_id"], name: "index_tabs_on_customer_id"
  end

  add_foreign_key "items", "tabs"
  add_foreign_key "tabs", "businesses"
  add_foreign_key "tabs", "customers"
end
