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

ActiveRecord::Schema.define(version: 20190518001054) do

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
    t.string "series_name", default: "splathon", null: false
    t.integer "numbering", default: 0, null: false
    t.index ["held_on"], name: "index_events_on_held_on"
    t.index ["series_name", "numbering"], name: "index_events_on_series_name_and_numbering", unique: true
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
    t.bigint "tournament_id"
    t.index ["opponent_id"], name: "index_matches_on_opponent_id"
    t.index ["team_id"], name: "index_matches_on_team_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "notices", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_notices_on_event_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "event_id"
    t.string "slack_username", comment: "kawakubox 変わる可能性があるが参加登録時のもの"
    t.string "slack_user_id", comment: "U0XXXXXXX"
    t.string "nickname", comment: "かわくぼっくす"
    t.string "fullname_kana", comment: "ヤマダハナコ"
    t.string "company_name"
    t.string "raw_password"
    t.string "icon_url", comment: "slack icon image URL"
    t.boolean "is_staff", comment: "0: スタッフでない, 1: スタッフ"
    t.boolean "join_party", comment: "0: 懇親会不参加, 1: 懇親会参加"
    t.boolean "has_companion", comment: "0: 同伴者なし, 1: 同伴者あり"
    t.integer "fee", comment: "合計参加費"
    t.bigint "team_id"
    t.string "rank_splat_zones", comment: "A+, X (2401~2500)"
    t.string "rank_tower_control", comment: "A+, X (2401~2500)"
    t.string "rank_rainmaker", comment: "A+, X (2401~2500)"
    t.string "rank_clam_blitz", comment: "A+, X (2401~2500)"
    t.string "main_weapon", comment: "スプラシューター"
    t.string "short_comment", comment: "一言コメント e.g. 今日も一日頑張るぞい!"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_switch_dock", null: false, default: false
    t.integer "order_in_team"
    t.index ["event_id", "slack_user_id"], name: "idx_participants_1"
    t.index ["event_id", "slack_username"], name: "idx_participants_2"
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["team_id"], name: "index_participants_on_team_id"
  end

  create_table "qualifiers", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "round"
    t.integer "order_of_match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_qualifiers_on_event_id"
  end

  create_table "receptions", force: :cascade do |t|
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.index ["participant_id"], name: "index_receptions_on_participant_id"
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

  create_table "slack_billing_changes", force: :cascade do |t|
    t.string "detected_on", null: false
    t.string "member_id", null: false
    t.string "display_name", null: false
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "short_comment"
    t.string "name_kana"
    t.index ["event_id"], name: "index_teams_on_event_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "event_id"
    t.integer "round", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "XX回戦", null: false
    t.index ["event_id"], name: "index_tournaments_on_event_id"
  end

  add_foreign_key "battles", "matches"
  add_foreign_key "battles", "rules"
  add_foreign_key "battles", "stages"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "notices", "events"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "teams"
  add_foreign_key "receptions", "participants"
  add_foreign_key "tournaments", "events"
end
