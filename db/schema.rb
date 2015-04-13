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

ActiveRecord::Schema.define(version: 20150413031918) do

  create_table "appraisees", force: true do |t|
    t.text     "trainings"
    t.text     "projects"
    t.text     "appreciations"
    t.text     "remarks"
    t.text     "feedback"
    t.integer  "user_id"
    t.string   "month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
    t.boolean  "is_complete",   default: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "username",        limit: 25
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "password_digest", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "manager_id"
  end

end
