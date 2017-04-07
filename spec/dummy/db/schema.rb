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

ActiveRecord::Schema.define(version: 20170405160406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopper_addresses", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "street",           null: false
    t.string   "city",             null: false
    t.string   "zip",              null: false
    t.string   "phone",            null: false
    t.integer  "country_id",       null: false
    t.string   "type",             null: false
    t.string   "addressable_type", null: false
    t.integer  "addressable_id",   null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["addressable_type", "addressable_id"], name: "index_shopper_addresses_on_addressable_type_and_addressable_id", using: :btree
    t.index ["country_id"], name: "index_shopper_addresses_on_country_id", using: :btree
  end

  create_table "shopper_countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shopper_countries_on_name", unique: true, using: :btree
  end

  create_table "shopper_coupons", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "code",       null: false
    t.float    "discount",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopper_coupons_on_order_id", using: :btree
  end

  create_table "shopper_credit_cards", force: :cascade do |t|
    t.string   "number",          null: false
    t.string   "name",            null: false
    t.date     "expiration_date", null: false
    t.integer  "cvv",             null: false
    t.integer  "order_id",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["order_id"], name: "index_shopper_credit_cards_on_order_id", using: :btree
  end

  create_table "shopper_deliveries", force: :cascade do |t|
    t.string   "title",                              default: ""
    t.integer  "min_days",                                        null: false
    t.integer  "max_days",                                        null: false
    t.decimal  "price",      precision: 8, scale: 2,              null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "shopper_order_items", force: :cascade do |t|
    t.integer  "quantity",     default: 1, null: false
    t.integer  "order_id",                 null: false
    t.string   "product_type",             null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["order_id"], name: "index_shopper_order_items_on_order_id", using: :btree
    t.index ["product_type", "product_id"], name: "index_shopper_order_items_on_product_type_and_product_id", using: :btree
  end

  create_table "shopper_orders", force: :cascade do |t|
    t.integer  "delivery_id"
    t.string   "number",        default: ""
    t.datetime "completed_at"
    t.boolean  "use_billing",   default: false, null: false
    t.string   "customer_type"
    t.integer  "customer_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "state",                         null: false
    t.index ["customer_type", "customer_id"], name: "index_shopper_orders_on_customer_type_and_customer_id", using: :btree
    t.index ["delivery_id"], name: "index_shopper_orders_on_delivery_id", using: :btree
  end

  add_foreign_key "shopper_coupons", "shopper_orders", column: "order_id"
  add_foreign_key "shopper_credit_cards", "shopper_orders", column: "order_id"
  add_foreign_key "shopper_order_items", "shopper_orders", column: "order_id"
  add_foreign_key "shopper_orders", "shopper_deliveries", column: "delivery_id"
end
