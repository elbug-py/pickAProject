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

ActiveRecord::Schema[7.0].define(version: 2023_10_16_012154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_inscriptions_on_project_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "duration"
    t.datetime "postulations_due_date"
    t.boolean "is_payed"
    t.string "amount"
    t.integer "vacancies"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_type", default: 1, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1, null: false
    t.bigint "area_id", null: false
    t.index ["area_id"], name: "index_users_on_area_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inscriptions", "projects"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "users", "areas"
end
