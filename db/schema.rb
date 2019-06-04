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

ActiveRecord::Schema.define(version: 2019_06_04_153353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "event"
    t.boolean "group"
    t.datetime "event_date"
    t.string "photo"
    t.integer "capacity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.boolean "confirmed", default: true
    t.index ["address_id"], name: "index_activities_on_address_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_interests", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_interests_on_activity_id"
    t.index ["interest_id"], name: "index_activity_interests_on_interest_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "suite"
    t.string "district"
    t.string "city"
    t.string "state"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zipcode"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.boolean "check", default: false
    t.date "schedule_date"
    t.bigint "activity_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "interest_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "addresses"
  add_foreign_key "activities", "users"
  add_foreign_key "activity_interests", "activities"
  add_foreign_key "activity_interests", "interests"
  add_foreign_key "addresses", "users"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
end
