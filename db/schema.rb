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

ActiveRecord::Schema.define(version: 20160417090128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_methods", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture_url"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "request_id", null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["request_id"], name: "index_messages_on_request_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "content"
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type"
  end

  add_index "notifications", ["receiver_id"], name: "index_notifications_on_receiver_id", using: :btree
  add_index "notifications", ["sender_id"], name: "index_notifications_on_sender_id", using: :btree
  add_index "notifications", ["type"], name: "index_notifications_on_type", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "carrier_id",   null: false
    t.integer  "price",        null: false
    t.date     "arrival_date", null: false
    t.integer  "request_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.text     "description"
    t.integer  "delivery_method_id"
    t.string   "picture_url"
    t.integer  "offer_price"
    t.integer  "quantity",             default: 1
    t.integer  "status",               default: 0
    t.integer  "requester_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "selling_location_id"
    t.integer  "delivery_location_id"
    t.string   "check_validate",       default: ""
    t.string   "links"
    t.boolean  "has_deposited",        default: false
  end

  add_index "requests", ["description"], name: "index_requests_on_description", using: :btree
  add_index "requests", ["name"], name: "index_requests_on_name", using: :btree

  create_table "travel_plans", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "country",     null: false
    t.datetime "return_date", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "travel_plans", ["user_id"], name: "index_travel_plans_on_user_id", using: :btree

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
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users", column: "receiver_id"
  add_foreign_key "notifications", "users", column: "sender_id"
  add_foreign_key "offers", "users", column: "carrier_id"
  add_foreign_key "requests", "locations", column: "delivery_location_id"
  add_foreign_key "requests", "locations", column: "selling_location_id"
  add_foreign_key "requests", "users", column: "requester_id"
  add_foreign_key "travel_plans", "users"
end
