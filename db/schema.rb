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

ActiveRecord::Schema.define(:version => 20110831020711) do

  create_table "mp3s", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "artist"
    t.string  "length"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mp3s", ["title", "artist"], :name => "index_mp3s_on_title_and_artist", :unique => true

  create_table "ratings", :force => true do |t|
    t.integer  "value"
    t.integer  "mp3_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["mp3_id"], :name => "index_ratings_on_mp3_id"

end
