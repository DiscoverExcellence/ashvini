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

ActiveRecord::Schema.define(version: 20150810111527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "scoring_pts"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "played_on"
    t.string   "date"
  end

  create_table "matches", force: :cascade do |t|
    t.string   "no_of_player"
    t.string   "integer"
    t.string   "venue"
    t.string   "string"
    t.string   "played_on"
    t.string   "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "game_id"
    t.integer  "score_id"
    t.integer  "tournament_id"
  end

  add_index "matches", ["game_id"], name: "index_matches_on_game_id", using: :btree
  add_index "matches", ["score_id"], name: "index_matches_on_score_id", using: :btree
  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.integer  "user_id"
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "tournament_id"
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id", using: :btree
  add_index "scores", ["player_id"], name: "index_scores_on_player_id", using: :btree
  add_index "scores", ["tournament_id"], name: "index_scores_on_tournament_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "game_id"
    t.integer  "user_id"
  end

  add_index "tournaments", ["game_id"], name: "index_tournaments_on_game_id", using: :btree
  add_index "tournaments", ["user_id"], name: "index_tournaments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "password_digest"
    t.string   "password"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "matches", "games"
  add_foreign_key "matches", "scores"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "players", "users"
  add_foreign_key "scores", "matches"
  add_foreign_key "scores", "players"
  add_foreign_key "scores", "tournaments"
  add_foreign_key "tournaments", "games"
  add_foreign_key "tournaments", "users"
end
