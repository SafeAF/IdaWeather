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

ActiveRecord::Schema[7.0].define(version: 2023_03_25_163025) do
  create_table "graphs", force: :cascade do |t|
    t.string "name", default: ""
    t.text "description", default: ""
    t.integer "start_year", default: 0
    t.integer "end_year", default: 0
    t.integer "year", default: 0
    t.boolean "range", default: false
    t.integer "month", default: 0
    t.integer "day", default: 0
    t.integer "hour", default: 0
    t.string "independent_var", default: ""
    t.string "dependent_var", default: ""
    t.string "chart_type", default: ""
    t.string "category", default: ""
    t.string "location", default: ""
    t.string "lat", default: ""
    t.string "lon", default: ""
    t.string "function", default: ""
    t.integer "study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_graphs_on_study_id"
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "graphs", "studies"
  add_foreign_key "studies", "users"
end
