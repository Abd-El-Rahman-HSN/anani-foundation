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

ActiveRecord::Schema.define(version: 20180306143740) do

  create_table "carpet_data", force: :cascade do |t|
    t.float    "width"
    t.float    "length"
    t.integer  "knot"
    t.integer  "code"
    t.string   "name"
    t.string   "main_model"
    t.string   "raw_material_name"
    t.integer  "raw_material_quantity"
    t.integer  "number_of_rows"
    t.string   "name_design"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "job_order_id"
    t.float    "price_hundred"
    t.string   "seda"
  end

  create_table "carpetmaterials", force: :cascade do |t|
    t.integer  "carpet_id"
    t.integer  "raw_material_id"
    t.integer  "quantity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["carpet_id"], name: "index_carpetmaterials_on_carpet_id"
    t.index ["raw_material_id"], name: "index_carpetmaterials_on_raw_material_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_production_inputs", force: :cascade do |t|
    t.integer  "serial"
    t.date     "date"
    t.integer  "number_of_row"
    t.integer  "numrefpart"
    t.integer  "totalrefpart"
    t.integer  "prevproduc"
    t.integer  "curproduc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "job_order_id"
    t.string   "report_kind"
  end

  create_table "daily_production_lines", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "daily_production_input_id"
    t.integer  "number_of_rows"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "daily_production_input_trainee_id"
    t.index ["daily_production_input_id"], name: "index_daily_production_lines_on_daily_production_input_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "kind"
    t.float    "amount"
    t.date     "date"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["workshop_id"], name: "index_expenses_on_workshop_id"
  end

  create_table "extras", force: :cascade do |t|
    t.float    "cost"
    t.integer  "worker_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["worker_id"], name: "index_extras_on_worker_id"
    t.index ["workshop_id"], name: "index_extras_on_workshop_id"
  end

  create_table "invoice_payment_scheduels", force: :cascade do |t|
    t.decimal  "amount"
    t.date     "due_from"
    t.date     "due_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "invoice_serial"
    t.date     "date"
    t.string   "customer"
    t.integer  "phone"
    t.string   "item"
    t.float    "quantity"
    t.float    "unit_price"
    t.float    "discount"
    t.integer  "tax"
    t.string   "idnum"
    t.string   "name"
    t.integer  "length"
    t.integer  "width"
    t.integer  "space"
    t.string   "raw"
    t.integer  "prmetre"
    t.integer  "total"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "job_order_raw_materials", force: :cascade do |t|
    t.integer  "job_order_id"
    t.integer  "raw_material_warehouse_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "job_order_workers", force: :cascade do |t|
    t.integer  "job_order_id"
    t.integer  "worker_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status",       default: 0
  end

  create_table "job_orders", force: :cascade do |t|
    t.string   "serial"
    t.date     "date"
    t.string   "item"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "location_id"
    t.integer  "workshop_id"
    t.integer  "loom_id"
    t.integer  "production_phase_id"
    t.integer  "status",              default: 0
    t.string   "carpet_name"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "looms", force: :cascade do |t|
    t.integer  "reference"
    t.integer  "workshop_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "seda_worker"
    t.string   "seda_trainer"
    t.index ["workshop_id"], name: "index_looms_on_workshop_id"
  end

  create_table "main_designes", force: :cascade do |t|
    t.integer  "design_code"
    t.string   "name"
    t.text     "description"
    t.integer  "refpart"
    t.integer  "lines"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "production_phases", force: :cascade do |t|
    t.string   "main_material"
    t.integer  "phase_no"
    t.string   "initial_letter"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.integer  "pr_serial"
    t.date     "date"
    t.string   "item"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raw_material_warehouses", force: :cascade do |t|
    t.integer  "code"
    t.string   "item"
    t.text     "description"
    t.string   "uom"
    t.integer  "safety_level"
    t.string   "category"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "job_order_id"
    t.integer  "quantity",     default: 0
  end

  create_table "receive_group_lines", force: :cascade do |t|
    t.integer  "job_order_id"
    t.integer  "receive_group_id"
    t.float    "cost"
    t.integer  "length"
    t.integer  "width"
    t.integer  "area"
    t.string   "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["job_order_id"], name: "index_receive_group_lines_on_job_order_id"
    t.index ["receive_group_id"], name: "index_receive_group_lines_on_receive_group_id"
  end

  create_table "receive_groups", force: :cascade do |t|
    t.integer  "workshop_id"
    t.integer  "send_group_id"
    t.string   "serial"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["send_group_id"], name: "index_receive_groups_on_send_group_id"
    t.index ["workshop_id"], name: "index_receive_groups_on_workshop_id"
  end

  create_table "reductions", force: :cascade do |t|
    t.float    "cost"
    t.integer  "worker_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["worker_id"], name: "index_reductions_on_worker_id"
    t.index ["workshop_id"], name: "index_reductions_on_workshop_id"
  end

  create_table "request_material_lines", force: :cascade do |t|
    t.integer  "request_material_id"
    t.integer  "raw_material_warehouse_id"
    t.integer  "quantity"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "request_materials", force: :cascade do |t|
    t.integer  "job_order_id"
    t.string   "serial"
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status",       default: 0
    t.index ["job_order_id"], name: "index_request_materials_on_job_order_id"
  end

  create_table "send_group_lines", force: :cascade do |t|
    t.integer  "send_group_id"
    t.integer  "job_order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["job_order_id"], name: "index_send_group_lines_on_job_order_id"
    t.index ["send_group_id"], name: "index_send_group_lines_on_send_group_id"
  end

  create_table "send_groups", force: :cascade do |t|
    t.string   "serial"
    t.integer  "workshop_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
    t.index ["workshop_id"], name: "index_send_groups_on_workshop_id"
  end

  create_table "showrooms", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "location",      null: false
    t.text     "address",       null: false
    t.string   "person_name",   null: false
    t.string   "person_number", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "person"
    t.string   "person_phone"
    t.string   "category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "names"
    t.integer  "lengths"
    t.integer  "widths"
    t.integer  "spaces"
    t.string   "raws"
    t.integer  "pricemetre"
    t.integer  "totals"
    t.integer  "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_tasks_on_invoice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.boolean  "inventory"
    t.boolean  "recorder"
    t.string   "full_name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouse_transaction_lines", force: :cascade do |t|
    t.integer  "warehouse_transaction_id"
    t.integer  "raw_material_warehouse_id"
    t.integer  "quantity"
    t.integer  "required_quantity"
    t.integer  "unit"
    t.string   "suppliers"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "request_material_line_id"
    t.index ["raw_material_warehouse_id"], name: "index_warehouse_transaction_lines_on_raw_material_warehouse_id"
    t.index ["warehouse_transaction_id"], name: "index_warehouse_transaction_lines_on_warehouse_transaction_id"
  end

  create_table "warehouse_transactions", force: :cascade do |t|
    t.integer  "request_material_id"
    t.date     "date"
    t.string   "serial"
    t.integer  "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["request_material_id"], name: "index_warehouse_transactions_on_request_material_id"
  end

  create_table "workers", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "category"
    t.string   "rate_unit"
    t.integer  "rate_amount"
    t.string   "fired"
    t.date     "firing_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "job_order_id"
    t.integer  "workshop_id"
    t.datetime "hire_date"
  end

  create_table "workshop_salaries", force: :cascade do |t|
    t.date     "date"
    t.integer  "workshop_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "user_id"
    t.index ["location_id"], name: "index_workshops_on_location_id"
  end

end
