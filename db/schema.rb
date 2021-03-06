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

ActiveRecord::Schema.define(version: 20150219095926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "media_type"
    t.date     "released"
    t.string   "runtime"
    t.string   "plot"
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
    t.string   "genre",                            array: true
    t.string   "director",                         array: true
    t.string   "writer",                           array: true
    t.string   "actors",                           array: true
  end

  add_index "movies", ["id"], name: "index_movies_on_id", using: :btree

  create_table "posters", force: :cascade do |t|
    t.binary   "data"
    t.integer  "size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "movie_id"
    t.string   "content_type"
  end

  add_index "posters", ["movie_id"], name: "index_posters_on_movie_id", using: :btree
  add_index "posters", ["size"], name: "index_posters_on_size", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "firstname"
    t.string   "gender"
    t.string   "locale"
    t.string   "email"
    t.string   "image_url"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "user_password"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "viewings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "movie_id"
    t.datetime "date"
    t.string   "format"
    t.string   "comments"
    t.boolean  "first_time", default: true
    t.integer  "rating"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "viewings", ["movie_id"], name: "index_viewings_on_movie_id", using: :btree
  add_index "viewings", ["user_id"], name: "index_viewings_on_user_id", using: :btree

end
