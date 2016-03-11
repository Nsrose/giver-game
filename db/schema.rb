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

ActiveRecord::Schema.define(version: 20160310082132) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "givingGames", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "release_date"
    t.decimal  "total_money",     precision: 8, scale: 2
    t.decimal  "per_transaction", precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "charityA_title"
    t.integer  "votesA"
    t.string   "charityB_title"
    t.integer  "votesB"
  end

  create_table "giving_games", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "total_money",     precision: 8, scale: 2
    t.decimal  "per_transaction", precision: 8, scale: 2
    t.string   "charityA_title"
    t.string   "charityB_title"
    t.integer  "votesA"
    t.integer  "votesB"
  end

end
