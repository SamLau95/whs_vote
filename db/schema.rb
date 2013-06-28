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

ActiveRecord::Schema.define(:version => 20130628061227) do

  create_table "students", :force => true do |t|
    t.string   "name"
    t.integer  "s_id"
    t.string   "birthdate"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "grade"
    t.string   "remember_token"
  end

  add_index "students", ["remember_token"], :name => "index_students_on_remember_token"
  add_index "students", ["s_id"], :name => "index_students_on_s_id", :unique => true

end
