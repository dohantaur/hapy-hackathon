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

ActiveRecord::Schema.define(version: 20160614132141) do

  create_table "green_houses", force: :cascade do |t|
    t.string   "serial"
    t.string   "name"
    t.string   "description"
    t.string   "soil"
    t.integer  "actual_program"
    t.string   "picture_url"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "green_houses", ["actual_program"], name: "index_green_houses_on_actual_program"
  add_index "green_houses", ["user_id"], name: "index_green_houses_on_user_id"

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "plant_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "soil"
    t.integer  "temperature"
    t.integer  "humidity"
    t.integer  "light"
    t.integer  "moisture"
    t.string   "description"
    t.integer  "plant_type_template_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plant_type_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "soil"
    t.string   "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "program_template_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.datetime "plantationDate"
    t.integer  "temperature"
    t.integer  "humidity"
    t.integer  "light"
    t.integer  "moisture"
    t.string   "description"
    t.string   "picture_url"
    t.integer  "green_house_id"
    t.integer  "plant_template_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "plants", ["green_house_id"], name: "index_plants_on_green_house_id"

  create_table "program_templates", force: :cascade do |t|
    t.string   "name"
    t.integer  "humidity"
    t.integer  "temperature"
    t.integer  "light"
    t.integer  "moisture"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "temperature"
    t.integer  "humidity"
    t.integer  "light"
    t.integer  "moisture"
    t.integer  "program_template_id"
    t.integer  "green_house_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "programs", ["green_house_id"], name: "index_programs_on_green_house_id"
  add_index "programs", ["program_template_id"], name: "index_programs_on_program_template_id"

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "email"
    t.string   "picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
