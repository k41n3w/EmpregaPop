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

ActiveRecord::Schema.define(version: 2021_09_05_183823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text "description"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_abouts_on_portfolio_id"
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "additional_informations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_additional_informations_on_portfolio_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "kind"
    t.integer "position"
    t.integer "side"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_blocks_on_portfolio_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "address_country"
    t.string "address_city"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_contacts_on_portfolio_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "institution"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_educations_on_portfolio_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "company"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_experiences_on_portfolio_id"
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "title"
    t.decimal "percent", precision: 5, scale: 2
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_hobbies_on_portfolio_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "title"
    t.decimal "percent", precision: 5, scale: 2
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_languages_on_portfolio_id"
  end

  create_table "portfolio_tags", force: :cascade do |t|
    t.bigint "portfolio_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_tags_on_portfolio_id"
    t.index ["tag_id"], name: "index_portfolio_tags_on_tag_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "slug"
    t.boolean "active", default: false
    t.boolean "listed", default: false
    t.boolean "featured", default: false
    t.integer "temp_avatar"
    t.boolean "remote_ok"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_profiles_on_portfolio_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.decimal "percent", precision: 5, scale: 2
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_skills_on_portfolio_id"
  end

  create_table "socials", force: :cascade do |t|
    t.integer "kind"
    t.string "url"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_socials_on_portfolio_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "abouts", "portfolios"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "additional_informations", "portfolios"
  add_foreign_key "blocks", "portfolios"
  add_foreign_key "contacts", "portfolios"
  add_foreign_key "educations", "portfolios"
  add_foreign_key "experiences", "portfolios"
  add_foreign_key "hobbies", "portfolios"
  add_foreign_key "languages", "portfolios"
  add_foreign_key "portfolio_tags", "portfolios"
  add_foreign_key "portfolio_tags", "tags"
  add_foreign_key "portfolios", "users"
  add_foreign_key "profiles", "portfolios"
  add_foreign_key "skills", "portfolios"
  add_foreign_key "socials", "portfolios"
end
