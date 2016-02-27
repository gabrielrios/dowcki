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

ActiveRecord::Schema.define(version: 20160227010404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_objects", force: :cascade do |t|
    t.string   "code_hash"
    t.string   "type"
    t.string   "superclass"
    t.string   "value"
    t.integer  "namespace_id"
    t.string   "namespace"
    t.string   "name"
    t.text     "source"
    t.string   "source_type"
    t.string   "signature"
    t.boolean  "dynamic"
    t.integer  "visibility"
    t.text     "files",        default: [],              array: true
    t.integer  "line"
    t.integer  "scope"
    t.json     "parameters"
    t.json     "aliases"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "project_id",                null: false
  end

  add_index "code_objects", ["code_hash"], name: "index_code_objects_on_code_hash", using: :btree
  add_index "code_objects", ["name"], name: "index_code_objects_on_name", using: :btree
  add_index "code_objects", ["namespace"], name: "index_code_objects_on_namespace", using: :btree
  add_index "code_objects", ["project_id"], name: "index_code_objects_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "repository_url",                null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "processing",     default: true
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
