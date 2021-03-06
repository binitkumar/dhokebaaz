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

ActiveRecord::Schema.define(version: 20150512210816) do

  create_table "comments", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dhokebaaz_id"
    t.boolean  "post_as_anonymas"
    t.integer  "user_id"
  end

  create_table "dhokebaaz_supports", force: true do |t|
    t.integer  "dhokebaaz_id"
    t.integer  "user_id"
    t.string   "ip_address"
    t.text     "message"
    t.boolean  "post_as_anonymous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dhokebaaz_supports", ["dhokebaaz_id"], name: "index_dhokebaaz_supports_on_dhokebaaz_id", using: :btree
  add_index "dhokebaaz_supports", ["user_id"], name: "index_dhokebaaz_supports_on_user_id", using: :btree

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
    t.integer  "user_id"
    t.string   "tags"
    t.string   "slug"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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

  add_index "proofs", ["dhokebaaz_id"], name: "index_proofs_on_dhokebaaz_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                      default: ""
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "username"
    t.boolean  "tos"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
