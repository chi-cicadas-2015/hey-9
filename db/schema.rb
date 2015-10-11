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

ActiveRecord::Schema.define(version: 20151011175749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "commentable_type", null: false
    t.integer  "commentable_id",   null: false
    t.integer  "commenter_id",     null: false
    t.text     "content",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "direct_conversations", force: :cascade do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_connections", force: :cascade do |t|
    t.integer  "dog_id",                          null: false
    t.integer  "following_id",                    null: false
    t.integer  "relationship_status", default: 1
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "owner_id",    null: false
    t.text     "bio"
    t.string   "profile_img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_invitations", force: :cascade do |t|
    t.integer  "event_id",                        null: false
    t.integer  "invitee_id",                      null: false
    t.string   "rsvp_status", default: "pending"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "creator_id",  null: false
    t.string   "location",    null: false
    t.datetime "event_start", null: false
    t.datetime "event_end",   null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.json     "location"
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.json     "location",        null: false
    t.boolean  "receive_notices"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
