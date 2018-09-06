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

ActiveRecord::Schema.define(version: 2018_09_05_141924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "panier_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["panier_id"], name: "index_orders_on_panier_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "paniers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_paniers_on_user_id", unique: true
  end

  create_table "paniers_plats", force: :cascade do |t|
    t.bigint "panier_id"
    t.bigint "plat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantité"
    t.index ["panier_id"], name: "index_paniers_plats_on_panier_id"
    t.index ["plat_id"], name: "index_paniers_plats_on_plat_id"
  end

  create_table "plats", force: :cascade do |t|
    t.bigint "user_id"
    t.string "titre"
    t.text "description"
    t.integer "prix"
    t.integer "stock", default: 1
    t.string "plage_horaire"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plats_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.string "téléphone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "prénom"
    t.string "nom"
    t.string "ville"
    t.string "téléphone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "paniers"
  add_foreign_key "orders", "users"
  add_foreign_key "paniers", "users"
  add_foreign_key "paniers_plats", "paniers"
  add_foreign_key "paniers_plats", "plats"
  add_foreign_key "plats", "users"
end
