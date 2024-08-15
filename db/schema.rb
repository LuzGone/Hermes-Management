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

ActiveRecord::Schema[7.1].define(version: 2024_08_15_001343) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.string "endereco"
    t.string "telefone"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "danfe"
    t.string "nfe"
    t.string "nome_cliente"
    t.string "cpf_cliente"
    t.string "endereco_cliente"
    t.string "status_pedido"
    t.string "nome_fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders_vehicles", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "vehicle_id"
    t.index ["order_id"], name: "index_orders_vehicles_on_order_id"
    t.index ["vehicle_id"], name: "index_orders_vehicles_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "placa"
    t.string "modelo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles_drivers", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "driver_id"
    t.index ["driver_id"], name: "index_vehicles_drivers_on_driver_id"
    t.index ["vehicle_id"], name: "index_vehicles_drivers_on_vehicle_id"
  end

end
