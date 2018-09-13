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

ActiveRecord::Schema.define(version: 2018_09_13_184321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_plats", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "plat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_plats_on_category_id"
    t.index ["plat_id"], name: "index_categories_plats_on_plat_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "titre"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_comments_on_restaurant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "panier_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["panier_id"], name: "index_orders_on_panier_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_plats", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "plat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_plats_on_order_id"
    t.index ["plat_id"], name: "index_orders_plats_on_plat_id"
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
    t.float "prix"
    t.integer "stock", default: 1
    t.string "plage_horaire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_plats_on_restaurant_id"
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

  create_table "searches", force: :cascade do |t|
    t.string "keyword"
    t.string "category"
    t.float "min_prix"
    t.float "max_prix"
    t.string "prénom"
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "categories_plats", "categories"
  add_foreign_key "categories_plats", "plats"
  add_foreign_key "comments", "users"
  add_foreign_key "orders", "paniers"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_plats", "orders"
  add_foreign_key "orders_plats", "plats"
  add_foreign_key "paniers", "users"
  add_foreign_key "paniers_plats", "paniers"
  add_foreign_key "paniers_plats", "plats"
  add_foreign_key "plats", "users"
end
