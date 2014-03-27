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

ActiveRecord::Schema.define(version: 20140327231215) do

  create_table "athletes", force: true do |t|
    t.string   "name"
    t.integer  "grade"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coach_id"
    t.boolean  "boy"
    t.boolean  "girl"
  end

  create_table "coaches", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "coaches", ["email"], name: "index_coaches_on_email", unique: true
  add_index "coaches", ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true

  create_table "eight_hundred_meter_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_boys", force: true do |t|
    t.boolean  "boys_400_m_im"
    t.boolean  "boys_1600_m"
    t.boolean  "boys_400_m"
    t.boolean  "boys_110_m_hh"
    t.boolean  "boys_800_m"
    t.boolean  "boys_3200_m"
    t.boolean  "boys_200_m"
    t.integer  "athlete_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "boys_100_m"
    t.integer  "time_minutes_400_m_im"
    t.integer  "time_minutes_1600_m"
    t.integer  "time_minutes_400_m"
    t.integer  "time_minutes_110_m_hh"
    t.integer  "time_minutes_800_m"
    t.integer  "time_minutes_3200_m"
    t.integer  "time_minutes_200_m"
    t.integer  "time_minutes_100_m"
    t.integer  "time_seconds_400_m_im"
    t.integer  "time_seconds_1600_m"
    t.integer  "time_seconds_400_m"
    t.integer  "time_seconds_110_m_hh"
    t.integer  "time_seconds_800_m"
    t.integer  "time_seconds_3200_m"
    t.integer  "time_seconds_200_m"
    t.integer  "time_seconds_100_m"
    t.integer  "time_decimals_400_m_im"
    t.integer  "time_decimals_1600_m"
    t.integer  "time_decimals_400_m"
    t.integer  "time_decimals_110_m_hh"
    t.integer  "time_decimals_800_m"
    t.integer  "time_decimals_3200_m"
    t.integer  "time_decimals_200_m"
    t.integer  "time_decimals_100_m"
    t.string   "place_400_m_im"
    t.string   "place_1600_m"
    t.string   "place_100_m"
    t.string   "place_400_m"
    t.string   "place_110_m_hh"
    t.string   "place_800_m"
    t.string   "place_3200_m"
    t.string   "place_200_m"
  end

  create_table "four_hundred_hurdles_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "four_hundred_meter_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meets", force: true do |t|
    t.date     "date"
    t.string   "name"
    t.string   "location"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_relay"
    t.integer  "second_relay"
    t.integer  "third_relay"
    t.integer  "first_regular"
    t.integer  "second_regular"
    t.integer  "third_regular"
    t.integer  "fourth_regular"
    t.integer  "fifth_regular"
    t.integer  "sixth_regular"
    t.float    "boys_total_points"
    t.float    "girls_total_points"
  end

  create_table "one_hundred_meter_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_hundred_meters", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_ten_hurdle_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opponents", force: true do |t|
    t.integer  "school_id"
    t.integer  "meet_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "racers", force: true do |t|
    t.integer  "athlete_id"
    t.string   "eight_hundred_meter_m_id_integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.integer  "coach_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.integer  "year"
    t.boolean  "spring"
    t.boolean  "winter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coach_id"
  end

  create_table "sixteen_hundred_meter_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_hundred_meter_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_mile_ms", force: true do |t|
    t.integer  "meet_id"
    t.integer  "first_place_id"
    t.integer  "second_place_id"
    t.integer  "third_place_id"
    t.integer  "fourth_place_id"
    t.integer  "fifth_place_id"
    t.integer  "sixth_place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
