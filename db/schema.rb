# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_30_092240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "physicals", force: :cascade do |t|
    t.date "date"
    t.float "weight"
    t.float "body_percentage"
    t.float "muscle_mass"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_physicals_on_user_id"
  end

  create_table "targets", force: :cascade do |t|
    t.date "date"
    t.date "datetime"
    t.float "target_weight"
    t.float "target_body_percentage"
    t.float "target_muscle_mass"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  add_foreign_key "physicals", "users"
  add_foreign_key "targets", "users"
end
