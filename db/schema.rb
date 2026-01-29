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

ActiveRecord::Schema[7.1].define(version: 2026_01_28_010106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "code", limit: 3, null: false
    t.string "name", limit: 100, null: false
    t.string "symbol", limit: 10, null: false
    t.decimal "exchange_rate", precision: 12, scale: 6, default: "1.0", null: false
    t.boolean "is_base", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_currencies_on_active"
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "payment_terms", force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.string "name", limit: 100, null: false
    t.integer "days", null: false
    t.text "description"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_payment_terms_on_active"
    t.index ["code"], name: "index_payment_terms_on_code", unique: true
  end

  create_table "supplier_contacts", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255
    t.string "phone", limit: 20
    t.string "mobile", limit: 20
    t.string "position", limit: 100
    t.string "department", limit: 100
    t.boolean "primary", default: false, null: false
    t.boolean "active", default: true, null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary"], name: "index_supplier_contacts_on_primary"
    t.index ["supplier_id"], name: "index_supplier_contacts_on_supplier_id"
  end

  create_table "supplier_statuses", force: :cascade do |t|
    t.string "code", limit: 50, null: false
    t.string "name", limit: 100, null: false
    t.string "description", limit: 255
    t.string "color", limit: 20
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_supplier_statuses_on_code", unique: true
  end

  create_table "supplier_types", force: :cascade do |t|
    t.string "code", limit: 50, null: false
    t.string "name", limit: 100, null: false
    t.string "description", limit: 255
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_supplier_types_on_code", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.string "name", limit: 255, null: false
    t.string "tax_id", limit: 20
    t.bigint "supplier_type_id"
    t.bigint "supplier_status_id", default: 1, null: false
    t.decimal "quality_score", precision: 3, scale: 2, default: "0.0"
    t.decimal "delivery_score", precision: 3, scale: 2, default: "0.0"
    t.bigint "payment_term_id", default: 3, null: false
    t.bigint "currency_id", default: 1, null: false
    t.decimal "credit_limit", precision: 15, scale: 2, default: "0.0"
    t.string "notes", limit: 500
    t.boolean "active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_suppliers_on_currency_id"
    t.index ["payment_term_id"], name: "index_suppliers_on_payment_term_id"
    t.index ["supplier_status_id"], name: "index_suppliers_on_supplier_status_id"
    t.index ["supplier_type_id"], name: "index_suppliers_on_supplier_type_id"
  end

  add_foreign_key "supplier_contacts", "suppliers"
  add_foreign_key "suppliers", "currencies"
  add_foreign_key "suppliers", "payment_terms"
  add_foreign_key "suppliers", "supplier_statuses"
  add_foreign_key "suppliers", "supplier_types"
end
