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

ActiveRecord::Schema.define(version: 20150308142900) do

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

  create_table "answers", force: :cascade do |t|
    t.integer  "applicant_id"
    t.integer  "question_id"
    t.boolean  "answer"
    t.text     "explanation"
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
    t.string   "availability_status"
    t.string   "work_experience"
    t.string   "avatar_uid"
    t.string   "avatar_name"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true
  add_index "applicants", ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true

  create_table "certificates", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.integer  "year"
    t.string   "grade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_preferences", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.integer  "number_of_years"
    t.string   "address"
    t.string   "contact"
    t.string   "company"
    t.string   "position"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "applicant_id"
    t.integer  "level"
    t.string   "institution"
    t.string   "field"
    t.string   "grade"
    t.string   "awards"
    t.string   "location"
    t.string   "major"
    t.integer  "graduation_year"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.integer  "relationship"
    t.string   "address"
    t.string   "company"
    t.date     "dob"
    t.string   "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "job_preferences", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "first_pref"
    t.string   "second_pref"
    t.string   "third_pref"
    t.string   "source"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "language"
    t.integer  "spoken"
    t.integer  "written"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "skill"
    t.integer  "years_of_experience"
    t.integer  "proficiency"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
