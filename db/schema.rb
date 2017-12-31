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

ActiveRecord::Schema.define(version: 20171230222249) do

  create_table "events", force: :cascade do |t|
    t.date "held_on"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["held_on"], name: "index_events_on_held_on"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "opponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "qualifier_id"
    t.integer "team_points"
    t.integer "opponent_points"
    t.integer "room_id"
    t.index ["opponent_id"], name: "index_matches_on_opponent_id"
    t.index ["team_id"], name: "index_matches_on_team_id"
  end

  create_table "qualifiers", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "round"
    t.integer "order_of_match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_qualifiers_on_event_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "event_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rooms_on_event_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "event_id"
    t.string "name"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0, null: false
    t.index ["event_id"], name: "index_teams_on_event_id"
  end

end
