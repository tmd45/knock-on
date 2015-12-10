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

ActiveRecord::Schema.define(version: 20151205091939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name",                   null: false
    t.string   "name_kana"
    t.integer  "order",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groups", ["order"], name: "idx_groups_order", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "provider",             null: false
    t.string   "uid",                  null: false
    t.string   "email",                null: false
    t.string   "given_name"
    t.string   "given_name_kana"
    t.string   "given_name_alphabet"
    t.string   "family_name"
    t.string   "family_name_kana"
    t.string   "family_name_alphabet"
    t.string   "image_url"
    t.string   "slack_identifier"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "group_id"
    t.string   "title"
    t.string   "title_alphabet"
    t.boolean  "administrator"
  end

  add_index "members", ["email"], name: "idx_members_email", unique: true, using: :btree
  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree
  add_index "members", ["provider", "uid"], name: "idx_members_provider_uid", unique: true, using: :btree

end
