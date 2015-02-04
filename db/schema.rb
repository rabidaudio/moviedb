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

ActiveRecord::Schema.define(version: 20150204130058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "imdb_id"
    t.string   "media_type"
    t.date     "released"
    t.string   "runtime"
    t.string   "genre"
    t.string   "director"
    t.string   "writer"
    t.string   "actors"
    t.string   "plot"
    t.binary   "poster"
    t.string   "metascore"
    t.string   "language"
    t.string   "country"
    t.string   "awards"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "rated"
    t.string   "imdb_rating"
    t.string   "imdb_votes"
    t.string   "tomato_meter"
    t.string   "tomato_rating"
    t.string   "tomato_reviews"
    t.string   "tomato_fresh"
    t.string   "tomato_rotten"
    t.string   "tomato_consensus"
    t.string   "tomato_user_meter"
    t.string   "tomato_user_rating"
    t.string   "tomato_user_reviews"
    t.string   "dvd"
    t.string   "box_office"
    t.string   "production"
    t.string   "website"
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "firstname"
    t.string   "gender"
    t.string   "locale"
    t.string   "image_url"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "user_password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "viewings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.date     "date"
    t.string   "format"
    t.string   "comments"
    t.boolean  "first_time"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "viewings", ["movie_id"], name: "index_viewings_on_movie_id", using: :btree
  add_index "viewings", ["user_id"], name: "index_viewings_on_user_id", using: :btree

end
