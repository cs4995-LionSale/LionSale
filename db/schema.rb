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

ActiveRecord::Schema.define(version: 2021_10_30_194917) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category_id", null: false
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
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
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

  create_table "photos", force: :cascade do |t|
    t.string "photo_url"
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_photos_on_item_id"
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
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "avatar_url"
    t.string "address"
    t.float "rating_seller"
    t.float "rating_buyer"
    t.integer "permission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "messages", "items"
  add_foreign_key "messages", "users", column: "from_id"
  add_foreign_key "messages", "users", column: "to_id"
  add_foreign_key "photos", "items"
  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "seller_id"
end
