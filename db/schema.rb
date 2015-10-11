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

ActiveRecord::Schema.define(version: 20151009222242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "commenter_id"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "conversings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
  end

  create_table "direct_conversations", force: :cascade do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_connections", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.integer  "relationship_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "owner_id",    null: false
    t.string   "bio"
    t.string   "profile_img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_invitations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "invitee_id"
    t.string   "rsvp_status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "creator_id"
    t.datetime "event_time"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "message_boards", force: :cascade do |t|
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "messageable_type"
    t.integer  "messageable_id"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "location"
    t.integer  "neighborhood_id"
    t.boolean  "receive_notices"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
