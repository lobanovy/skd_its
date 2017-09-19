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

ActiveRecord::Schema.define(version: 20170910102148) do

  create_table "card_groups", force: true do |t|
    t.integer "card_reader_id"
    t.integer "card_reader_group_id"
  end

  add_index "card_groups", ["card_reader_group_id"], name: "index_card_groups_on_card_reader_group_id", using: :btree
  add_index "card_groups", ["card_reader_id"], name: "index_card_groups_on_card_reader_id", using: :btree

  create_table "card_reader_groups", force: true do |t|
    t.string "name", limit: 32, null: false
  end

  create_table "card_readers", force: true do |t|
    t.string  "address",       limit: 15,             null: false
    t.string  "name",          limit: 24,             null: false
    t.integer "failure_count", limit: 1,  default: 0,              unsigned: true
  end

  create_table "cards", force: true do |t|
    t.integer  "card_reader_group_id"
    t.integer  "card_id",                                        null: false, unsigned: true
    t.integer  "time_end",                                       null: false, unsigned: true
    t.integer  "zone",                 limit: 1,  default: 0,                 unsigned: true
    t.string   "user_name",            limit: 32,                null: false
    t.boolean  "enable",                          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["card_reader_group_id"], name: "index_cards_on_card_reader_group_id", using: :btree

end
