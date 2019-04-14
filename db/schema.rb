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

ActiveRecord::Schema.define(version: 20190413133538) do

  create_table "battles", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "rule_id", null: false
    t.bigint "stage_id", null: false
    t.bigint "winner_id"
    t.integer "order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id", "order"], name: "index_battles_on_match_id_and_order", unique: true
    t.index ["match_id"], name: "index_battles_on_match_id"
    t.index ["rule_id"], name: "index_battles_on_rule_id"
    t.index ["stage_id"], name: "index_battles_on_stage_id"
  end

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
    t.integer "order"
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
    t.integer "priority", default: 0, null: false
    t.index ["event_id"], name: "index_rooms_on_event_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "key", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_rules_on_key", unique: true
    t.index ["name"], name: "index_rules_on_name", unique: true
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stages_on_name", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.integer "event_id"
    t.string "name"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0, null: false
    t.integer "rank", default: 0, null: false
    t.index ["event_id"], name: "index_teams_on_event_id"
  end

  add_foreign_key "battles", "matches"
  add_foreign_key "battles", "rules"
  add_foreign_key "battles", "stages"
end
