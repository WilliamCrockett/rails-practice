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

ActiveRecord::Schema.define(version: 20180310034412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.text "full_name"
    t.text "sas_number"
    t.text "email_address"
    t.text "cell_number"
    t.text "next_of_kin"
    t.text "nok_cell_num"
    t.text "shirt_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_crews_on_user_id"
  end

  create_table "event_crews", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["crew_id"], name: "index_event_crews_on_crew_id"
    t.index ["event_id"], name: "index_event_crews_on_event_id"
    t.index ["user_id"], name: "index_event_crews_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "event_date"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "crews", "users"
  add_foreign_key "event_crews", "crews"
  add_foreign_key "event_crews", "events"
  add_foreign_key "event_crews", "users"
  add_foreign_key "events", "users"
  add_foreign_key "examples", "users"
end
