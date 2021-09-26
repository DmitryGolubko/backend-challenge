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

ActiveRecord::Schema.define(version: 2021_09_26_151911) do

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "pizza_type_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id", "pizza_type_id"], name: "index_order_items_on_order_id_and_pizza_type_id", unique: true
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["pizza_type_id"], name: "index_order_items_on_pizza_type_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "total_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "discount", precision: 3, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pizza_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pizza_types_on_name", unique: true
  end

end
