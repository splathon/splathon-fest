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

ActiveRecord::Schema.define(version: 20160109114423) do

  create_table "fests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0, null: false
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "fest_id",               null: false
    t.string   "name",       limit: 16, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["fest_id"], name: "index_players_on_fest_id", using: :btree
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "fest_id",                           null: false
    t.string   "alpha",      limit: 32,             null: false
    t.string   "bravo",      limit: 32,             null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "status",                default: 0, null: false
    t.index ["fest_id"], name: "index_themes_on_fest_id", using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "theme_id",   null: false
    t.integer  "player_id",  null: false
    t.integer  "side",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_votes_on_player_id", using: :btree
    t.index ["theme_id", "player_id"], name: "index_votes_on_theme_id_and_player_id", unique: true, using: :btree
    t.index ["theme_id"], name: "index_votes_on_theme_id", using: :btree
  end

  add_foreign_key "players", "fests"
  add_foreign_key "themes", "fests"
  add_foreign_key "votes", "players"
  add_foreign_key "votes", "themes"
end
