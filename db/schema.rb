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

ActiveRecord::Schema.define(version: 20140228041408) do

  create_table "comments", force: true do |t|
    t.integer  "parent_comment_id"
    t.integer  "user_id",           null: false
    t.integer  "link_id",           null: false
    t.text     "body",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["link_id"], name: "index_comments_on_link_id"
  add_index "comments", ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "link_votes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "link_id",    null: false
    t.integer  "direction",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_votes", ["link_id", "user_id"], name: "index_link_votes_on_link_id_and_user_id", unique: true
  add_index "link_votes", ["link_id"], name: "index_link_votes_on_link_id"
  add_index "link_votes", ["user_id"], name: "index_link_votes_on_user_id"

  create_table "links", force: true do |t|
    t.string   "title",                                     null: false
    t.string   "url",              limit: 1024,             null: false
    t.text     "description"
    t.integer  "user_id",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "up_votes_count",                default: 0
    t.integer  "down_votes_count",              default: 0
  end

  add_index "links", ["down_votes_count"], name: "index_links_on_down_votes_count"
  add_index "links", ["up_votes_count"], name: "index_links_on_up_votes_count"
  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "sub_memberships", force: true do |t|
    t.integer  "link_id",    null: false
    t.integer  "sub_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_memberships", ["link_id"], name: "index_sub_memberships_on_link_id"
  add_index "sub_memberships", ["sub_id"], name: "index_sub_memberships_on_sub_id"

  create_table "subs", force: true do |t|
    t.integer  "moderator_id", null: false
    t.string   "name",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["moderator_id"], name: "index_subs_on_moderator_id"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
