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

ActiveRecord::Schema.define(version: 20150510153437) do

  create_table "comments", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dhokebaaz_id"
  end

  create_table "dhokebaazs", force: true do |t|
    t.text     "story"
    t.string   "incident_time"
    t.string   "dhokebaaz_name"
    t.text     "address"
    t.text     "other_details"
    t.text     "fb_profile_url"
    t.boolean  "post_as_anonymous"
    t.string   "name"
    t.string   "email"
    t.boolean  "name_visible_to_public"
    t.boolean  "recive_update_on_comments"
    t.boolean  "recive_messages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "last_name"
    t.string   "city"
    t.string   "zipcode"
  end

  create_table "proofs", force: true do |t|
    t.integer  "dhokebaaz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.text     "detail"
  end

  add_index "proofs", ["dhokebaaz_id"], name: "index_proofs_on_dhokebaaz_id"

end
