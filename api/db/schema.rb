# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_10_145748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caterers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "business_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_options", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "day"
    t.string "imageUrl"
    t.index ["menu_id"], name: "index_menu_options_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "caterer_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "day_of_week"
    t.index ["caterer_id"], name: "index_menus_on_caterer_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "shipping_location"
    t.index ["menu_option_id"], name: "index_orders_on_menu_option_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "caterer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caterer_id"], name: "index_reviews_on_caterer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "menu_options", "menus"
  add_foreign_key "menus", "caterers"
  add_foreign_key "orders", "menu_options"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "caterers"
  add_foreign_key "reviews", "users"
end
