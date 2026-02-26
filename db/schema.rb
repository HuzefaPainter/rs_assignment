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

ActiveRecord::Schema[8.0].define(version: 2026_02_26_140624) do
  create_table "activities", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "duration_minutes", default: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_activities", force: :cascade do |t|
    t.integer "program_day_id", null: false
    t.integer "activity_id", null: false
    t.string "sort_order", default: "0", null: false
    t.string "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_day_activities_on_activity_id"
    t.index ["program_day_id"], name: "index_day_activities_on_program_day_id"
  end

  create_table "program_days", force: :cascade do |t|
    t.integer "program_id", null: false
    t.integer "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id", "day"], name: "index_program_days_on_program_id_and_day", unique: true
    t.index ["program_id"], name: "index_program_days_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title", null: false
    t.integer "days", default: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activity_completions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "day_activity_id", null: false
    t.datetime "completed_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_activity_id"], name: "index_user_activity_completions_on_day_activity_id"
    t.index ["user_id", "day_activity_id"], name: "index_user_activity_unique", unique: true
    t.index ["user_id"], name: "index_user_activity_completions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "day_activities", "activities"
  add_foreign_key "day_activities", "program_days"
  add_foreign_key "program_days", "programs"
  add_foreign_key "user_activity_completions", "day_activities"
  add_foreign_key "user_activity_completions", "users"
end
