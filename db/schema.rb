# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_01_020252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prize_picks_players", force: :cascade do |t|
    t.string "api_id", null: false
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prize_picks_projections", force: :cascade do |t|
    t.string "api_id", null: false
    t.jsonb "data", default: {}, null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_prize_picks_projections_on_player_id"
  end

  create_table "waitlists", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_waitlists_on_email", unique: true
  end

  add_foreign_key "prize_picks_projections", "prize_picks_players", column: "player_id"
end
