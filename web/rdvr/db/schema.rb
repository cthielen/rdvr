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

ActiveRecord::Schema.define(version: 20150318022503) do

  create_table "recordings", force: :cascade do |t|
    t.integer  "show_id"
    t.string   "filename"
    t.string   "title"
    t.datetime "started"
    t.datetime "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.text     "description"
    t.string   "genre"
    t.boolean  "weekly"
    t.datetime "start"
    t.integer  "duration"
    t.string   "host"
    t.integer  "port"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
