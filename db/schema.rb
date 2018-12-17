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

ActiveRecord::Schema.define(version: 2018_12_16_011012) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.string "content"
    t.integer "user_id"
    t.boolean "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "status"
    t.integer "user_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_questions_on_answer_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "screen_name"
    t.string "email"
    t.string "token"
    t.integer "Answer_id"
    t.integer "Question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_token"
    t.index ["Answer_id"], name: "index_users_on_Answer_id"
    t.index ["Question_id"], name: "index_users_on_Question_id"
  end

end
