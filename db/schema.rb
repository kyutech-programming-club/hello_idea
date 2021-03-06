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

ActiveRecord::Schema.define(version: 2019_01_31_143344) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.text "body"
    t.integer "topic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_ideas_on_topic_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "invests", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_invests_on_topic_id"
    t.index ["user_id"], name: "index_invests_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "likable_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "likable_type"
    t.index ["likable_id"], name: "index_likes_on_likable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "mandal_ideas", force: :cascade do |t|
    t.integer "sea_id", null: false
    t.integer "simple_mandal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sea_id"], name: "index_mandal_ideas_on_sea_id"
    t.index ["simple_mandal_id"], name: "index_mandal_ideas_on_simple_mandal_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "message", null: false
    t.boolean "has_read", default: false, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "random_words_ideas", force: :cascade do |t|
    t.integer "sea_id", null: false
    t.integer "word1_id", null: false
    t.integer "word2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sea_id"], name: "index_random_words_ideas_on_sea_id"
    t.index ["word1_id"], name: "index_random_words_ideas_on_word1_id"
    t.index ["word2_id"], name: "index_random_words_ideas_on_word2_id"
  end

  create_table "seas", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seas_on_user_id"
  end

  create_table "simple_mandals", force: :cascade do |t|
    t.string "elem_1_1"
    t.string "elem_1_2"
    t.string "elem_1_3"
    t.string "elem_1_4"
    t.string "elem_1_5"
    t.string "elem_1_6"
    t.string "elem_1_7"
    t.string "elem_1_8"
    t.string "elem_1_9"
    t.string "elem_2_1"
    t.string "elem_2_2"
    t.string "elem_2_3"
    t.string "elem_2_4"
    t.string "elem_2_5"
    t.string "elem_2_6"
    t.string "elem_2_7"
    t.string "elem_2_8"
    t.string "elem_2_9"
    t.string "elem_3_1"
    t.string "elem_3_2"
    t.string "elem_3_3"
    t.string "elem_3_4"
    t.string "elem_3_5"
    t.string "elem_3_6"
    t.string "elem_3_7"
    t.string "elem_3_8"
    t.string "elem_3_9"
    t.string "elem_4_1"
    t.string "elem_4_2"
    t.string "elem_4_3"
    t.string "elem_4_4"
    t.string "elem_4_5"
    t.string "elem_4_6"
    t.string "elem_4_7"
    t.string "elem_4_8"
    t.string "elem_4_9"
    t.string "elem_5_1"
    t.string "elem_5_2"
    t.string "elem_5_3"
    t.string "elem_5_4"
    t.string "elem_5_5"
    t.string "elem_5_6"
    t.string "elem_5_7"
    t.string "elem_5_8"
    t.string "elem_5_9"
    t.string "elem_6_1"
    t.string "elem_6_2"
    t.string "elem_6_3"
    t.string "elem_6_4"
    t.string "elem_6_5"
    t.string "elem_6_6"
    t.string "elem_6_7"
    t.string "elem_6_8"
    t.string "elem_6_9"
    t.string "elem_7_1"
    t.string "elem_7_2"
    t.string "elem_7_3"
    t.string "elem_7_4"
    t.string "elem_7_5"
    t.string "elem_7_6"
    t.string "elem_7_7"
    t.string "elem_7_8"
    t.string "elem_7_9"
    t.string "elem_8_1"
    t.string "elem_8_2"
    t.string "elem_8_3"
    t.string "elem_8_4"
    t.string "elem_8_5"
    t.string "elem_8_6"
    t.string "elem_8_7"
    t.string "elem_8_8"
    t.string "elem_8_9"
    t.string "elem_9_1"
    t.string "elem_9_2"
    t.string "elem_9_3"
    t.string "elem_9_4"
    t.string "elem_9_5"
    t.string "elem_9_6"
    t.string "elem_9_7"
    t.string "elem_9_8"
    t.string "elem_9_9"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_simple_mandals_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "genre_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "support", default: 0
    t.index ["genre_id"], name: "index_topics_on_genre_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "point", default: 100
  end

  create_table "words", force: :cascade do |t|
    t.string "word", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
