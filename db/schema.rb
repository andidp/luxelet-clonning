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

ActiveRecord::Schema.define(version: 20170818022359) do

  create_table "enquiries", force: :cascade do |t|
    t.integer "property_id"
    t.datetime "checkin"
    t.datetime "checkout"
    t.datetime "reserved_at"
    t.datetime "booked_at"
    t.datetime "expired_at"
    t.datetime "completed_at"
    t.string "reference_number"
    t.integer "number_of_adults"
    t.integer "number_of_children"
    t.integer "number_of_infants"
    t.decimal "total_cost"
    t.decimal "tax"
    t.string "currency"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_enquiries_on_property_id"
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "enquiry_id"
    t.string "from"
    t.string "to"
    t.string "subject"
    t.text "body"
    t.datetime "message_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enquiry_id"], name: "index_messages_on_enquiry_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "enquiry_id"
    t.decimal "amount"
    t.string "currency"
    t.datetime "payment_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enquiry_id"], name: "index_payments_on_enquiry_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "searchable"
    t.decimal "cost"
    t.decimal "tax"
    t.string "currency"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "property_image_file_name"
    t.string "property_image_content_type"
    t.integer "property_image_file_size"
    t.datetime "property_image_updated_at"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "full_name"
    t.string "role"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
