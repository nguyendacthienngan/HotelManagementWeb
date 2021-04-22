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

ActiveRecord::Schema.define(version: 2021_04_21_100317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "citizen_id", null: false
    t.boolean "is_female"
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
    t.boolean "is_female"
    t.string "nationality"
    t.datetime "date_of_birth"
    t.string "email"
    t.integer "status", null: false
    t.string "phone_number"
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
    t.bigint "reservation_id"
    t.index ["reservation_id"], name: "index_payments_on_reservation_id"
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
    t.integer "status", null: false
    t.datetime "arrival_date", null: false
    t.datetime "leave_date", null: false
    t.datetime "check_in_date", null: false
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.bigint "employee_id"
    t.bigint "room_id"
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["employee_id"], name: "index_reservations_on_employee_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "hour_price", null: false
    t.decimal "date_price", null: false
    t.decimal "past_night_price", null: false
    t.decimal "week_price", null: false
    t.decimal "month_price", null: false
    t.decimal "add_adult_price", null: false
    t.decimal "add_child_price", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "beds", null: false
    t.integer "status", null: false
    t.integer "floor", null: false
    t.integer "capacity"
    t.decimal "price", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "roomType_id"
    t.index ["roomType_id"], name: "index_rooms_on_roomType_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "unit_price", null: false
    t.string "description"
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
