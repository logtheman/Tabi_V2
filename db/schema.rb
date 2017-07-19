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

ActiveRecord::Schema.define(version: 20170716182026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.decimal  "lat",                         null: false
    t.decimal  "decimal",                     null: false
    t.decimal  "{:precision=>10, :scale=>6}", null: false
    t.decimal  "lng",                         null: false
    t.string   "description"
    t.string   "formatted_address"
    t.jsonb    "address_components"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.datetime "start_at",                         null: false
    t.datetime "end_at",                           null: false
    t.string   "type",        default: "activity", null: false
    t.integer  "location_id",                      null: false
    t.jsonb    "details"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["location_id"], name: "index_milestones_on_location_id", using: :btree
  end

  create_table "transportations", force: :cascade do |t|
    t.datetime "start_at",          null: false
    t.datetime "end_at",            null: false
    t.string   "type",              null: false
    t.integer  "start_location_id", null: false
    t.integer  "end_location_id",   null: false
    t.string   "distance"
    t.string   "estimated_cost"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["end_location_id"], name: "index_transportations_on_end_location_id", using: :btree
    t.index ["start_location_id"], name: "index_transportations_on_start_location_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "provider"
    t.string   "name"
    t.string   "image_url"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "trips", "users"
end
