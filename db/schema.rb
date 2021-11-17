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

ActiveRecord::Schema.define(version: 2021_11_06_195917) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "seller_id", null: false
    t.decimal "price"
    t.integer "status"
    t.integer "stock"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["seller_id", "created_at"], name: "index_items_on_seller_id_and_created_at"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.integer "item_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_messages_on_from_id"
    t.index ["item_id"], name: "index_messages_on_item_id"
    t.index ["to_id"], name: "index_messages_on_to_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "seller_id", null: false
    t.integer "buyer_id", null: false
    t.datetime "expected_deal_time"
    t.datetime "real_deal_time"
    t.string "deal_address"
    t.decimal "deal_price"
    t.integer "status"
    t.integer "seller_rating"
    t.integer "buyer_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "address"
    t.float "rating_seller"
    t.float "rating_buyer"
    t.integer "permission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "items", "users", column: "category_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "messages", "users", column: "from_id"
  add_foreign_key "messages", "users", column: "item_id"
  add_foreign_key "messages", "users", column: "to_id"
  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "item_id"
  add_foreign_key "transactions", "users", column: "seller_id"
end
