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

ActiveRecord::Schema[7.0].define(version: 2023_07_02_173936) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "season_drivers", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "driver_id", null: false
    t.integer "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_season_drivers_on_driver_id"
    t.index ["season_id"], name: "index_season_drivers_on_season_id"
    t.index ["team_id"], name: "index_season_drivers_on_team_id"
  end

  create_table "season_race_results", force: :cascade do |t|
    t.integer "season_race_id", null: false
    t.integer "season_driver_id", null: false
    t.boolean "fastest_lap"
    t.integer "point"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_driver_id"], name: "index_season_race_results_on_season_driver_id"
    t.index ["season_race_id"], name: "index_season_race_results_on_season_race_id"
  end

  create_table "season_races", force: :cascade do |t|
    t.string "name"
    t.integer "circuit_id", null: false
    t.integer "season_id", null: false
    t.string "race_type"
    t.decimal "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_season_races_on_circuit_id"
    t.index ["season_id"], name: "index_season_races_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "season_drivers", "drivers"
  add_foreign_key "season_drivers", "seasons"
  add_foreign_key "season_drivers", "teams"
  add_foreign_key "season_race_results", "season_drivers"
  add_foreign_key "season_race_results", "season_races"
  add_foreign_key "season_races", "circuits"
  add_foreign_key "season_races", "seasons"
end
