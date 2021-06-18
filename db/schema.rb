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

ActiveRecord::Schema.define(version: 2021_06_03_124721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "citizen_id", null: false
    t.integer "gender"
    t.string "nationality"
    t.datetime "date_of_birth"
    t.string "email"
    t.integer "client_type"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.integer "employee_type"
    t.string "citizen_id", null: false
    t.integer "gender"
    t.string "nationality"
    t.datetime "date_of_birth"
    t.string "email"
    t.integer "status", null: false
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "integer_parameters", force: :cascade do |t|
    t.string "param_name"
    t.integer "param_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "reservation_date", null: false
    t.boolean "is_paid", null: false
    t.decimal "deposit"
    t.decimal "temp_total"
    t.datetime "check_out_date"
    t.integer "payment_type", null: false
    t.decimal "total"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservation_details", force: :cascade do |t|
    t.datetime "date_charged", null: false
    t.integer "quantity", null: false
    t.decimal "total", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reservation_id"
    t.bigint "service_id"
    t.index ["reservation_id"], name: "index_reservation_details_on_reservation_id"
    t.index ["service_id"], name: "index_reservation_details_on_service_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "arrival_date", null: false
    t.datetime "leave_date", null: false
    t.datetime "check_in_date"
    t.integer "status", default: 1, null: false
    t.string "client_name", null: false
    t.string "client_citizen_id", null: false
    t.integer "children", default: 0, null: false
    t.integer "adults", default: 0, null: false
    t.string "description"
    t.integer "reservation_type", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.bigint "employee_id"
    t.bigint "room_id"
    t.bigint "payment_id"
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["employee_id"], name: "index_reservations_on_employee_id"
    t.index ["payment_id"], name: "index_reservations_on_payment_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "room_prices", force: :cascade do |t|
    t.decimal "price"
    t.integer "price_type"
    t.datetime "date"
    t.boolean "is_available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "room_type_id"
    t.index ["room_type_id"], name: "index_room_prices_on_room_type_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "beds", default: 0, null: false
    t.integer "available_rooms", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "status", null: false
    t.integer "floor", null: false
    t.string "description"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "room_type_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "unit_price", null: false
    t.string "description"
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
