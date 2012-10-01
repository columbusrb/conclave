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

ActiveRecord::Schema.define(:version => 20121001190703) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_settings", :force => true do |t|
    t.string "setting"
    t.string "value"
  end

  add_index "admin_settings", ["setting"], :name => "index_admin_settings_on_setting"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.integer  "parent_id"
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comments", ["conversation_id"], :name => "index_comments_on_conversation_id"

  create_table "conversations", :force => true do |t|
    t.string   "title"
    t.integer  "forum_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count", :default => 0
  end

  add_index "conversations", ["creator_id"], :name => "index_conversations_on_creator_id"
  add_index "conversations", ["forum_id"], :name => "index_conversations_on_forum_id"

  create_table "forums", :force => true do |t|
    t.string "title"
  end

  create_table "uploaded_files", :force => true do |t|
    t.integer  "comment_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "uploaded_files", ["comment_id"], :name => "index_uploaded_files_on_comment_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",            :null => false
    t.string   "encrypted_password",     :default => "",            :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "role",                   :default => "contributor"
    t.string   "nickname"
    t.string   "provider"
    t.string   "secret"
    t.string   "token"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
