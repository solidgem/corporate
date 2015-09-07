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

ActiveRecord::Schema.define(version: 20150904081533) do

  create_table "attachments", force: :cascade do |t|
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost",                default: 0
    t.integer  "responsible_user_id"
    t.string   "status"
    t.string   "kind"
    t.datetime "deadline"
    t.datetime "finish_date"
    t.integer  "complaints"
    t.integer  "critical_complaints"
    t.boolean  "letters_of_thanks"
    t.string   "overdue_kind"
  end

  create_table "task_comments", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "elapsed_time", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "task_participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "responsible_user_id"
    t.integer  "total_elapsed_time",  default: 0, null: false
    t.datetime "deadline"
    t.string   "status"
    t.string   "competence"
    t.integer  "project_id"
    t.text     "access_data"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.integer  "inviter_id"
    t.string   "password_digest"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "role"
    t.string   "name"
    t.text     "contacts"
    t.text     "requisites"
    t.string   "position"
    t.integer  "hour_rate",                  default: 0
    t.integer  "external_hour_rate",         default: 0
    t.string   "profile_image_id"
    t.string   "profile_image_filename"
    t.integer  "profile_image_size"
    t.string   "profile_image_content_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
