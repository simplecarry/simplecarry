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

ActiveRecord::Schema.define(version: 20160410110749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_methods", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "carrier_id",   null: false
    t.integer  "price",        null: false
    t.date     "arrival_date", null: false
    t.integer  "requests_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name",                             null: false
    t.text     "description"
    t.integer  "delivery_methods_id"
    t.string   "picture_url"
    t.integer  "offer_price",                      null: false
    t.integer  "quantity",             default: 1, null: false
    t.integer  "status",               default: 0, null: false
    t.integer  "requester_id",                     null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "selling_location_id",              null: false
    t.integer  "delivery_location_id",             null: false
    t.integer  "selected_offer_id"
  end

  add_index "requests", ["description"], name: "index_requests_on_description", using: :btree
  add_index "requests", ["name"], name: "index_requests_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "requests", "locations", column: "delivery_location_id"
  add_foreign_key "requests", "locations", column: "selling_location_id"
  add_foreign_key "requests", "offers", column: "selected_offer_id"
  add_foreign_key "requests", "users", column: "requester_id"
end
