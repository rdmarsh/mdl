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

ActiveRecord::Schema.define(version: 20130909111451) do

  create_table "environments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "environments", ["name"], name: "index_environments_on_name", unique: true

  create_table "onemdl_settings", force: true do |t|
    t.string   "company_name"
    t.string   "company_tagline"
    t.string   "company_phone"
    t.string   "company_fax"
    t.string   "company_email"
    t.string   "company_address_1"
    t.string   "company_address_2"
    t.string   "company_city"
    t.string   "company_postcode"
    t.string   "company_country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
  end

  add_index "onemdl_settings", ["company_name"], name: "index_onemdl_settings_on_company_name"

  create_table "organisations", force: true do |t|
    t.string   "name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_reference"
    t.integer  "support_level_id",  limit: 255
    t.string   "relationship"
    t.boolean  "active"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "postcode"
    t.string   "country"
  end

  add_index "organisations", ["name"], name: "index_organisations_on_name", unique: true

  create_table "support_levels", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hours"
    t.string   "days"
    t.string   "exclusions"
  end

  add_index "support_levels", ["name"], name: "index_support_levels_on_name", unique: true

end
