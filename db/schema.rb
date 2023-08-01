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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_165251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "level"
    t.boolean "status", default: true
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departaments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "level"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_tasks", force: :cascade do |t|
    t.string "title"
    t.date "date_end"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "priority_id", null: false
    t.bigint "column_id", null: false
    t.bigint "company_id"
    t.bigint "departament_id", null: false
    t.date "date_end"
    t.bigint "tag_id"
    t.bigint "attachment_id"
    t.bigint "comment_id"
    t.bigint "sub_tasks_id"
    t.integer "automation_hours"
    t.integer "execution_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_tickets_on_attachment_id"
    t.index ["category_id"], name: "index_tickets_on_category_id"
    t.index ["column_id"], name: "index_tickets_on_column_id"
    t.index ["comment_id"], name: "index_tickets_on_comment_id"
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["departament_id"], name: "index_tickets_on_departament_id"
    t.index ["priority_id"], name: "index_tickets_on_priority_id"
    t.index ["sub_tasks_id"], name: "index_tickets_on_sub_tasks_id"
    t.index ["tag_id"], name: "index_tickets_on_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tickets", "attachments"
  add_foreign_key "tickets", "categories"
  add_foreign_key "tickets", "columns"
  add_foreign_key "tickets", "comments"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "departaments"
  add_foreign_key "tickets", "priorities"
  add_foreign_key "tickets", "sub_tasks", column: "sub_tasks_id"
  add_foreign_key "tickets", "tags"
end
