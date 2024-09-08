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

ActiveRecord::Schema[7.1].define(version: 2024_09_08_212840) do
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
    t.string "situacao"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivings", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "dataInicial", default: "2024-09-08 23:31:15", null: false
    t.datetime "dataFinal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_drivings_on_driver_id"
    t.index ["vehicle_id"], name: "index_drivings_on_vehicle_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "danfe"
    t.string "nfe"
    t.string "endereco_entrega"
    t.string "status_pedido", default: "PENDENTE"
    t.datetime "dataFornecimento", default: "2024-09-08 23:31:14", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transportings", force: :cascade do |t|
    t.string "origem"
    t.string "destino"
    t.datetime "dataDespache", default: "2024-09-08 23:31:15", null: false
    t.datetime "dataEntrega"
    t.bigint "order_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_transportings_on_order_id"
    t.index ["vehicle_id"], name: "index_transportings_on_vehicle_id"
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
    t.string "situacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drivings", "drivers"
  add_foreign_key "drivings", "vehicles"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "transportings", "orders"
  add_foreign_key "transportings", "vehicles"
end
