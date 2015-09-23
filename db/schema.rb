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

ActiveRecord::Schema.define(:version => 20150923143634) do

  create_table "bulletins", :force => true do |t|
    t.string   "text"
    t.boolean  "link"
    t.string   "link_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts_items", :id => false, :force => true do |t|
    t.integer "cart_id"
    t.integer "item_id"
  end

  create_table "colleges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "event_categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "event_categories_users", :id => false, :force => true do |t|
    t.integer "event_category_id"
    t.integer "user_id"
  end

  create_table "event_sponsors", :force => true do |t|
    t.string   "file_name"
    t.integer  "event_id"
    t.string   "link_url"
    t.integer  "rank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_tabs", :force => true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "active",                  :default => true
    t.integer  "rank",                    :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "show_after_registration", :default => false
  end

  create_table "events", :force => true do |t|
    t.integer  "event_category_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "online_registration",     :default => true
    t.boolean  "active",                  :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "min_per_team",            :default => 0
    t.integer  "max_per_team",            :default => 0
    t.date     "deadline"
    t.integer  "permitted_registrations", :default => 0
    t.integer  "registration_fee",        :default => 0
    t.boolean  "flagship",                :default => false
    t.boolean  "online_event",            :default => false
    t.boolean  "on_the_spot_event",       :default => false
  end

  create_table "items", :force => true do |t|
    t.string   "sku"
    t.integer  "product_id"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.string   "item_desc"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "total_amount", :precision => 8, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "order_id"
    t.decimal  "cart_amount",  :precision => 8, :scale => 2
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.string   "avatar"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "schedule_items", :force => true do |t|
    t.string   "description"
    t.datetime "event_start"
    t.datetime "event_end"
    t.string   "venue"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.boolean  "active",                 :default => true
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone"
    t.integer  "college_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
