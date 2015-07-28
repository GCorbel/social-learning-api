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

ActiveRecord::Schema.define(version: 20150624104352) do

  create_table "acquired_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  add_index "acquired_skills", ["skill_id"], name: "index_acquired_skills_on_skill_id"
  add_index "acquired_skills", ["user_id"], name: "index_acquired_skills_on_user_id"

  create_table "searched_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  add_index "searched_skills", ["skill_id"], name: "index_searched_skills_on_skill_id"
  add_index "searched_skills", ["user_id"], name: "index_searched_skills_on_user_id"

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.string "link"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "nickname"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
