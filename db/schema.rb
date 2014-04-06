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

ActiveRecord::Schema.define(:version => 20140405234339) do

  create_table "adv_logos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "analytics", :force => true do |t|
    t.string   "performed_by"
    t.string   "action"
    t.string   "performed_on"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "count",        :default => 0
  end

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "assets", :force => true do |t|
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.string   "type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "user_id"
  end

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conferences", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "custom_pages", :force => true do |t|
    t.text     "page_content"
    t.boolean  "display"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "customizers", :force => true do |t|
    t.string   "twitter_handle"
    t.string   "menu_color_one"
    t.string   "menu_color_two"
    t.string   "menu_font_color"
    t.string   "menu_font_size"
    t.string   "menu_header_color"
    t.text     "contact_us_body"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "event_logo_file_name"
    t.string   "event_logo_content_type"
    t.integer  "event_logo_file_size"
    t.datetime "event_logo_updated_at"
    t.string   "mail_subject"
    t.text     "ga"
    t.string   "ga_tracker_id"
  end

  create_table "downloadbles", :force => true do |t|
    t.string   "asset_dwnld_file_name"
    t.string   "asset_dwnld_content_type"
    t.integer  "asset_dwnld_file_size"
    t.datetime "asset_dwnld_updated_at"
    t.integer  "track_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "employees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "people_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_days", :force => true do |t|
    t.string   "name"
    t.integer  "conference_id"
    t.integer  "sequence",      :default => 0
    t.date     "event_date"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "event_asset_file_name"
    t.string   "event_asset_content_type"
    t.integer  "event_asset_file_size"
    t.datetime "event_asset_updated_at"
    t.integer  "event_day_id"
    t.integer  "user_id"
  end

  create_table "events_tracks", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "track_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "rate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feeds", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "followers", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "conference_id"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "meeters", :force => true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetings", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "questionables", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "approved"
    t.text     "quest_name"
    t.integer  "likes",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.boolean  "Liked"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipients", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "status"
  end

  create_table "recommends", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "done"
    t.string   "type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "recommended_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "can_message"
    t.boolean  "can_meet"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "speakers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.boolean  "display"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "company"
    t.string   "headline"
    t.string   "industry"
    t.string   "interest"
    t.string   "location"
    t.integer  "role_id"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "is_admin"
    t.string   "user_pic_file_name"
    t.string   "user_pic_content_type"
    t.integer  "user_pic_file_size"
    t.datetime "user_pic_updated_at"
    t.text     "extra_info"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "viewers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "count",      :default => 0
    t.integer  "viewed_by"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
