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

ActiveRecord::Schema.define(version: 20170125201010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_boards", force: :cascade do |t|
    t.integer  "level"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "skill",      default: 0
  end

  create_table "jobs", force: :cascade do |t|
    t.decimal  "money",        precision: 999, scale: 2, default: "0.0"
    t.integer  "time"
    t.integer  "job_board_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "skill",                                  default: 0
    t.index ["job_board_id"], name: "index_jobs_on_job_board_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "user_id"
    t.decimal  "money",      precision: 999, scale: 2, default: "1.0"
    t.integer  "tutorial",                             default: 0
    t.decimal  "skill",      precision: 10,  scale: 2, default: "0.0"
    t.boolean  "admin",                                default: false, null: false
    t.index ["name"], name: "index_players_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_players_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.decimal  "money",       precision: 999, scale: 2
    t.integer  "time"
    t.integer  "player_id"
    t.datetime "finished_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "skill",                                 default: 0
    t.index ["player_id"], name: "index_works_on_player_id", using: :btree
  end

  add_foreign_key "jobs", "job_boards"
  add_foreign_key "players", "users"
  add_foreign_key "works", "players"
end
