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

ActiveRecord::Schema.define(version: 20150324181449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_recipes", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dish_recipes", ["dish_id"], name: "index_dish_recipes_on_dish_id", using: :btree
  add_index "dish_recipes", ["recipe_id"], name: "index_dish_recipes_on_recipe_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "menu_id"
  end

  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favourited_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id", using: :btree

  create_table "inclusions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "inclusions", ["ingredient_id"], name: "index_inclusions_on_ingredient_id", using: :btree
  add_index "inclusions", ["recipe_id"], name: "index_inclusions_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["dish_id"], name: "index_likes_on_dish_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "menus", ["user_id"], name: "index_menus_on_user_id", using: :btree

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "recipe_id"
    t.string   "diet"
  end

  add_index "preferences", ["recipe_id"], name: "index_preferences_on_recipe_id", using: :btree
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "category"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "consumer_token"
    t.string   "omniauth_raw_data"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_foreign_key "dish_recipes", "dishes"
  add_foreign_key "dish_recipes", "recipes"
  add_foreign_key "dishes", "menus"
  add_foreign_key "favourites", "users"
  add_foreign_key "inclusions", "ingredients"
  add_foreign_key "inclusions", "recipes"
  add_foreign_key "likes", "dishes"
  add_foreign_key "likes", "users"
  add_foreign_key "menus", "users"
  add_foreign_key "preferences", "recipes"
  add_foreign_key "preferences", "users"
  add_foreign_key "recipes", "users"
end
