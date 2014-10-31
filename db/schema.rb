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

ActiveRecord::Schema.define(:version => 20131009172215) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "efederativas", :force => true do |t|
    t.string   "entidadFederativa"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "federal_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre"
    t.string   "ap_pat"
    t.string   "ap_mat"
    t.string   "institution_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "federal_users", ["email"], :name => "index_federal_users_on_email", :unique => true
  add_index "federal_users", ["reset_password_token"], :name => "index_federal_users_on_reset_password_token", :unique => true

  create_table "formularios", :force => true do |t|
    t.string   "responsable_llenado"
    t.date     "fecha"
    t.integer  "cod01"
    t.integer  "cod02"
    t.integer  "ape01"
    t.integer  "ape02"
    t.integer  "ape03"
    t.integer  "ape04"
    t.integer  "ape05"
    t.integer  "ape06"
    t.integer  "ape07"
    t.integer  "api01"
    t.integer  "api02"
    t.integer  "api03"
    t.integer  "api04"
    t.integer  "ssb01"
    t.integer  "cao01"
    t.integer  "cao02"
    t.integer  "cao03"
    t.integer  "cao04"
    t.integer  "cao05"
    t.integer  "cao06"
    t.integer  "cao07"
    t.integer  "cao08"
    t.integer  "cao09"
    t.integer  "cao10"
    t.integer  "cao11"
    t.integer  "cao12"
    t.integer  "tit01"
    t.integer  "uni01"
    t.integer  "uni02"
    t.integer  "uni03"
    t.integer  "ben01"
    t.integer  "ben02"
    t.integer  "per01"
    t.integer  "per02"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
    t.integer  "efederativa_id"
    t.integer  "jurisdiction_id"
  end

  create_table "institutions", :force => true do |t|
    t.string "institution_name"
  end

  create_table "jurisdictions", :force => true do |t|
    t.integer  "jurisdiction_anterior_id"
    t.integer  "efederativa_id"
    t.string   "municipio_id"
    t.string   "jurisdiction"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "municipios", :force => true do |t|
    t.integer  "id_municipio_ant"
    t.string   "municipio"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "efederativa_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "state_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "state_users", ["email"], :name => "index_state_users_on_email", :unique => true
  add_index "state_users", ["reset_password_token"], :name => "index_state_users_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "ap_pat"
    t.string   "ap_mat"
    t.integer  "id_efederativa"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "efederativa_id"
    t.string   "nombre"
    t.integer  "jurisdiction_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
