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

ActiveRecord::Schema.define(version: 20150612124003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_behaviors", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name",        limit: 30, null: false
    t.text     "answer",                 null: false
    t.string   "image_url",              null: false
    t.text     "description",            null: false
    t.integer  "deck_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name",       limit: 30,                          null: false
    t.string   "type",       limit: 30, default: "PersonalDeck", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "deck_id",                null: false
    t.integer  "right",      default: 0
    t.integer  "wrong",      default: 0
    t.integer  "card_idx",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 50, null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
