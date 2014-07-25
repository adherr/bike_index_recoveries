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

ActiveRecord::Schema.define(version: 20140724190728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: true do |t|
    t.integer  "bi_id",            null: false
    t.string   "bi_url",           null: false
    t.string   "bi_api_url",       null: false
    t.integer  "year"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "serial"
    t.string   "color"
    t.text     "description"
    t.integer  "stolen_record_id", null: false
    t.datetime "date_stolen"
    t.string   "stolen_location"
    t.datetime "date_recovered"
    t.text     "recovery_story"
    t.string   "tweet_text"
    t.string   "thumb"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_story"
    t.string   "photo"
  end

  create_table "twitter_accounts", force: true do |t|
    t.string   "screen_name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "user_token"
    t.string   "user_secret"
    t.string   "address"
    t.boolean  "default",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "twitter_accounts", ["latitude", "longitude"], name: "index_twitter_accounts_on_latitude_and_longitude", using: :btree

end
