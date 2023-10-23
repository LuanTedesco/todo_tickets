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

ActiveRecord::Schema[7.0].define(version: 2023_10_23_131529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_attachments_on_ticket_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "departament_id", null: false
    t.index ["departament_id"], name: "index_categories_on_departament_id"
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
    t.bigint "ticket_id", null: false
    t.bigint "user_id"
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
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

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.bigint "user_id"
    t.boolean "status", default: true, null: false
    t.bigint "departament_id"
    t.index ["departament_id"], name: "index_notifications_on_departament_id"
    t.index ["ticket_id"], name: "index_notifications_on_ticket_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
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
    t.bigint "ticket_id", null: false
    t.string "description"
    t.boolean "finished"
    t.date "finished_at"
    t.index ["ticket_id"], name: "index_sub_tasks_on_ticket_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "tags_tickets", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "ticket_id", null: false
    t.index ["tag_id", "ticket_id"], name: "index_tags_tickets_on_tag_id_and_ticket_id"
    t.index ["ticket_id", "tag_id"], name: "index_tags_tickets_on_ticket_id_and_tag_id"
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
    t.bigint "user_id"
    t.string "name_user"
    t.string "avatar_user"
    t.index ["attachment_id"], name: "index_tickets_on_attachment_id"
    t.index ["category_id"], name: "index_tickets_on_category_id"
    t.index ["column_id"], name: "index_tickets_on_column_id"
    t.index ["comment_id"], name: "index_tickets_on_comment_id"
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["departament_id"], name: "index_tickets_on_departament_id"
    t.index ["priority_id"], name: "index_tickets_on_priority_id"
    t.index ["sub_tasks_id"], name: "index_tickets_on_sub_tasks_id"
    t.index ["tag_id"], name: "index_tickets_on_tag_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.bigint "departament_id", null: false
    t.string "name", null: false
    t.boolean "status", default: true, null: false
    t.index ["departament_id"], name: "index_users_on_departament_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachments", "tickets"
  add_foreign_key "categories", "departaments"
  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "notifications", "departaments"
  add_foreign_key "notifications", "tickets"
  add_foreign_key "notifications", "users"
  add_foreign_key "sub_tasks", "tickets"
  add_foreign_key "tickets", "attachments"
  add_foreign_key "tickets", "categories"
  add_foreign_key "tickets", "columns"
  add_foreign_key "tickets", "comments"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "departaments"
  add_foreign_key "tickets", "priorities"
  add_foreign_key "tickets", "sub_tasks", column: "sub_tasks_id"
  add_foreign_key "tickets", "tags"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "departaments"
end
