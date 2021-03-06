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

ActiveRecord::Schema.define(:version => 20090211070007) do

  create_table "jumps", :force => true do |t|
    t.float    "jump_quotient"
    t.integer  "kanji_reading_id"
    t.integer  "kanji_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jumps", ["kanji_id"], :name => "index_jumps_on_kanji_id"
  add_index "jumps", ["kanji_reading_id"], :name => "index_jumps_on_kanji_reading_id"

  create_table "kana_readings", :force => true do |t|
    t.string   "reading"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kana_readings", ["word_id"], :name => "index_kana_readings_on_word_id"

  create_table "kanji_meanings", :force => true do |t|
    t.string   "meaning"
    t.integer  "kanji_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kanji_meanings", ["kanji_id"], :name => "index_kanji_meanings_on_kanji_id"

  create_table "kanji_readings", :force => true do |t|
    t.string   "reading"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kanji_readings", ["word_id"], :name => "index_kanji_readings_on_word_id"

  create_table "kanjis", :force => true do |t|
    t.string   "character"
    t.integer  "frequency"
    t.integer  "stroke_count"
    t.integer  "jlpt"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kun_readings", :force => true do |t|
    t.string   "reading"
    t.integer  "kanji_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kun_readings", ["kanji_id"], :name => "index_kun_readings_on_kanji_id"

  create_table "nanori_readings", :force => true do |t|
    t.string   "reading"
    t.integer  "kanji_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nanori_readings", ["kanji_id"], :name => "index_nanori_readings_on_kanji_id"

  create_table "on_readings", :force => true do |t|
    t.string   "reading"
    t.integer  "kanji_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "on_readings", ["kanji_id"], :name => "index_on_readings_on_kanji_id"

  create_table "parts", :force => true do |t|
    t.string   "pos"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["word_id"], :name => "index_parts_on_word_id"

  create_table "searches", :force => true do |t|
    t.string   "query"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "word_meanings", :force => true do |t|
    t.string   "meaning"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_meanings", ["word_id"], :name => "index_word_meanings_on_word_id"

  create_table "words", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
