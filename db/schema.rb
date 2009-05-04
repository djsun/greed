# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090501194952) do

  create_table "faces", :force => true do |t|
    t.integer  "value"
    t.integer  "roll_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "game_id"
    t.integer  "score",      :default => 0
    t.string   "strategy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolls", :force => true do |t|
    t.integer  "score",             :default => 0, :null => false
    t.integer  "accumulated_score", :default => 0, :null => false
    t.integer  "unused",            :default => 0, :null => false
    t.string   "action_name"
    t.integer  "turn_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", :force => true do |t|
    t.integer  "player_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
