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

ActiveRecord::Schema.define(:version => 20090325162553) do

  create_table "locations", :force => true do |t|
    t.string "name"
  end

  create_table "locations_users", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "user_id"
  end

  create_table "participations", :force => true do |t|
    t.string   "state"
    t.integer  "user_id"
    t.integer  "rota_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passwords", :force => true do |t|
    t.integer  "user_id"
    t.string   "reset_code"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string "name"
  end

  create_table "positions_rota_formats", :id => false, :force => true do |t|
    t.integer "rota_format_id"
    t.integer "position_id"
  end

  create_table "positions_users", :id => false, :force => true do |t|
    t.integer "position_id"
    t.integer "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "rota_formats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rotas", :force => true do |t|
    t.integer  "service_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "format_id"
  end

  add_index "rotas", ["format_id"], :name => "index_rotas_on_format_id"

  create_table "services", :force => true do |t|
    t.datetime "start_at"
    t.integer  "location_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "teams", :force => true do |t|
    t.string "name"
    t.string "basecamp_name"
  end

  create_table "unavailabilities", :force => true do |t|
    t.datetime "from"
    t.datetime "to"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :default => "", :null => false
    t.string   "crypted_password",    :default => "", :null => false
    t.string   "password_salt",       :default => "", :null => false
    t.string   "persistence_token",   :default => "", :null => false
    t.string   "single_access_token", :default => "", :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.integer  "login_count",         :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "surname"
    t.string   "phone"
  end

end
