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

ActiveRecord::Schema.define(version: 2018_08_21_231251) do

  create_table "continents", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 15, default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "countries", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 2, default: "", null: false
    t.string "name", limit: 50, default: "", null: false
    t.string "native", limit: 50, default: "", null: false
    t.string "phone", limit: 15, default: "", null: false
    t.string "capital", limit: 50, default: "", null: false
    t.string "currency", limit: 30, default: "", null: false
    t.integer "continent_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["code"], name: "code", unique: true
  end

  create_table "country_languages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["language_id", "country_id"], name: "country_language", unique: true
  end

  create_table "languages", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 2, default: "", null: false
    t.string "name", limit: 50, default: "", null: false
    t.string "native", limit: 50, default: "", null: false
    t.boolean "rtl", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["code"], name: "code", unique: true
  end

end
