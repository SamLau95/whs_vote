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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130705230017) do

  create_table "profiles", :force => true do |t|
    t.integer  "student_id"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.integer  "s_id"
    t.string   "birthdate"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "grade"
    t.string   "remember_token"
    t.boolean  "admin",          :default => false
    t.integer  "candidate"
  end

  add_index "students", ["remember_token"], :name => "index_students_on_remember_token"
  add_index "students", ["s_id"], :name => "index_students_on_s_id", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "cand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["cand_id"], :name => "index_votes_on_cand_id"
  add_index "votes", ["voter_id", "cand_id"], :name => "index_votes_on_voter_id_and_cand_id", :unique => true
  add_index "votes", ["voter_id"], :name => "index_votes_on_voter_id"

end
