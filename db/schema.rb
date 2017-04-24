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

ActiveRecord::Schema.define(version: 20170424163357) do

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.time     "time"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "group_size"
    t.time     "start_time"
    t.time     "end_time"
  end

  create_table "reservations_timeslots", id: false, force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "timeslot_id",    null: false
    t.index ["reservation_id", "timeslot_id"], name: "index_reservations_timeslots_on_reservation_id_and_timeslot_id"
    t.index ["timeslot_id", "reservation_id"], name: "index_reservations_timeslots_on_timeslot_id_and_reservation_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image_url"
    t.time     "opentime"
    t.time     "closetime"
    t.integer  "capacity"
    t.string   "cuisine"
    t.string   "address"
    t.string   "contact_number"
    t.string   "website"
    t.integer  "price_range"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer  "cap"
    t.integer  "people"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.datetime "start"
    t.datetime "end"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_number"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
