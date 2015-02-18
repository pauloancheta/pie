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

ActiveRecord::Schema.define(version: 20150218012426) do

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
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "recipe_id"
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipes", ["dish_id"], name: "index_recipes_on_dish_id", using: :btree

  add_foreign_key "dish_recipes", "dishes"
  add_foreign_key "dish_recipes", "recipes"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "dishes"
end
