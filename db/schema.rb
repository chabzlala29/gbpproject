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

ActiveRecord::Schema.define(version: 20150308135936) do

  create_table "address_infos", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "street"
    t.string   "village"
    t.string   "city"
    t.string   "country"
    t.string   "phone_home"
    t.string   "mobile"
    t.string   "phone_office"
    t.string   "fax"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "applicants", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "nickname"
    t.date     "birthdate"
    t.string   "citizenship"
    t.integer  "gender"
    t.string   "height"
    t.string   "religion"
    t.string   "sss_number"
    t.string   "birthplace"
    t.integer  "civil_status"
    t.decimal  "weight"
    t.string   "tin"
    t.string   "philhealth"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true
  add_index "applicants", ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true

end
