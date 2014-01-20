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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140117184423) do

  create_table "ride_offers", :force => true do |t|
    t.integer  "user_id"
    t.string   "origin"
    t.string   "destination"
    t.integer  "spots"
    t.integer  "cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "date"
  end

  create_table "ride_takes", :force => true do |t|
    t.integer  "ride_offer_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ride_takes", ["ride_offer_id"], :name => "index_ride_takes_on_ride_offer_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "token"
    t.string   "password_digest"
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
