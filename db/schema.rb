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

ActiveRecord::Schema.define(version: 2023_06_17_094157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "itemtests", force: :cascade do |t|
    t.integer "ordernum"
    t.integer "ratio"
    t.bigint "responsetype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "onetest_id", null: false
    t.string "title"
    t.bigint "tagtest_id"
    t.index ["onetest_id"], name: "index_itemtests_on_onetest_id"
    t.index ["responsetype_id"], name: "index_itemtests_on_responsetype_id"
    t.index ["tagtest_id"], name: "index_itemtests_on_tagtest_id"
  end

  create_table "onetests", force: :cascade do |t|
    t.string "title"
    t.bigint "discipline_id", null: false
    t.integer "ratio5"
    t.integer "ratio4"
    t.integer "ratio3"
    t.integer "ratio2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_onetests_on_discipline_id"
  end

  create_table "paragraphtests", force: :cascade do |t|
    t.integer "ordernum"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "posimage_id", null: false
    t.bigint "itemtest_id", null: false
    t.bigint "paragraphtype_id", null: false
    t.index ["itemtest_id"], name: "index_paragraphtests_on_itemtest_id"
    t.index ["paragraphtype_id"], name: "index_paragraphtests_on_paragraphtype_id"
    t.index ["posimage_id"], name: "index_paragraphtests_on_posimage_id"
  end

  create_table "paragraphtypes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posimages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "refers", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_refers_on_role_id"
  end

  create_table "responserights", force: :cascade do |t|
    t.bigint "itemtest_id", null: false
    t.string "response"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["itemtest_id"], name: "index_responserights_on_itemtest_id"
  end

  create_table "responsetypes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resultfiles", force: :cascade do |t|
    t.string "namefile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "mark"
    t.string "comment"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_resultfiles_on_role_id"
    t.index ["user_id"], name: "index_resultfiles_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.integer "mark"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "resultfile_id", null: false
    t.index ["resultfile_id"], name: "index_results_on_resultfile_id"
    t.index ["role_id"], name: "index_results_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "webtest_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["webtest_id"], name: "index_roles_on_webtest_id_id"
  end

  create_table "tagtests", force: :cascade do |t|
    t.bigint "discipline_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_tagtests_on_discipline_id"
  end

  create_table "testexecs", force: :cascade do |t|
    t.bigint "onetest_id", null: false
    t.datetime "datestart"
    t.datetime "datefinish"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ordernum"
    t.integer "timelimit"
    t.boolean "enskipstep"
    t.integer "assessment"
    t.integer "ratio"
    t.bigint "teacheruser_id"
    t.integer "responseall"
    t.integer "responseok"
    t.integer "responseerror"
    t.integer "responseskip"
    t.integer "notexec"
    t.integer "timeleft"
    t.index ["onetest_id"], name: "index_testexecs_on_onetest_id"
    t.index ["teacheruser_id"], name: "index_testexecs_on_teacheruser_id"
    t.index ["user_id"], name: "index_testexecs_on_user_id"
  end

  create_table "testexecsteps", force: :cascade do |t|
    t.bigint "testexec_id", null: false
    t.datetime "datestart"
    t.datetime "datefinish"
    t.bigint "itemtest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "response"
    t.integer "ratio"
    t.integer "duration"
    t.integer "ordernum"
    t.integer "countexec"
    t.datetime "laststart"
    t.index ["itemtest_id"], name: "index_testexecsteps_on_itemtest_id"
    t.index ["testexec_id"], name: "index_testexecsteps_on_testexec_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "surname", default: ""
    t.string "forme", default: ""
    t.string "teacher", default: "Student"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "webtasks", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "taskname"
    t.text "tasktask"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_webtasks_on_role_id"
  end

  create_table "webtests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "itemtests", "onetests"
  add_foreign_key "itemtests", "responsetypes"
  add_foreign_key "itemtests", "tagtests"
  add_foreign_key "onetests", "disciplines"
  add_foreign_key "paragraphtests", "itemtests"
  add_foreign_key "paragraphtests", "paragraphtypes"
  add_foreign_key "paragraphtests", "posimages"
  add_foreign_key "refers", "roles"
  add_foreign_key "responserights", "itemtests"
  add_foreign_key "resultfiles", "roles"
  add_foreign_key "resultfiles", "users"
  add_foreign_key "results", "resultfiles"
  add_foreign_key "results", "roles"
  add_foreign_key "tagtests", "disciplines"
  add_foreign_key "testexecs", "onetests"
  add_foreign_key "testexecs", "users"
  add_foreign_key "testexecs", "users", column: "teacheruser_id"
  add_foreign_key "testexecsteps", "itemtests"
  add_foreign_key "testexecsteps", "testexecs"
  add_foreign_key "webtasks", "roles"
end
