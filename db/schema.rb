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

ActiveRecord::Schema.define(version: 20160413203407) do

  create_table "messages", force: :cascade do |t|
    t.string "bike_id", limit: 255,   null: false
    t.text   "body",    limit: 65535, null: false
  end

  add_index "messages", ["bike_id"], name: "index_messages_on_bike_id", using: :btree

end