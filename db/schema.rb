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

ActiveRecord::Schema.define(:version => 20131030200715) do

  create_table "games", :force => true do |t|
    t.string   "game_id"
    t.string   "game_board",    :default => "yyyyyyyyy"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "winner"
    t.boolean  "player_one_go"
    t.integer  "play_count"
  end

  create_table "users", :force => true do |t|
    t.string   "user_id"
    t.string   "name"
    t.text     "avatar"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "role"
    t.string   "email"
    t.integer  "won"
    t.integer  "drew"
    t.integer  "lost"
  end

  create_table "users_games", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "is_player_1"
  end

end
