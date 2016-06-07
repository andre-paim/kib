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

ActiveRecord::Schema.define(version: 0) do

  create_table "courses", force: :cascade do |t|
    t.text "name"
    t.text "subject"
    t.text "kellogg_code"
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "class_ref"
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "course_id"
    t.integer "duration"
    t.integer "date_status"
    t.text    "status"
    t.integer "date_scheduled"
    t.boolean "teacher_was_present", default: false
    t.boolean "student_was_present", default: false
    t.integer "rating_teacher"
    t.integer "rating_student"
  end

  add_index "matchings", ["course_id"], name: "index_matchings_on_course_id"
  add_index "matchings", ["student_id"], name: "index_matchings_on_student_id"
  add_index "matchings", ["teacher_id"], name: "index_matchings_on_teacher_id"

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "active",    default: false
  end

  add_index "students", ["course_id"], name: "index_students_on_course_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "active",    default: false
  end

  add_index "teachers", ["course_id"], name: "index_teachers_on_course_id"
  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.text    "first_name"
    t.text    "last_name"
    t.text    "email"
    t.text    "program"
    t.integer "graduation_year"
    t.text    "password_digest"
    t.boolean "admin",             default: false
    t.integer "time_registration"
  end

end
