ActiveRecord::Schema.define(version: 2019_08_19_130412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campsites", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price_per_night"
    t.string "amenities"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "min_nights"
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.string "county"
    t.string "country"
    t.integer "max_guests"
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
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "city"
    t.string "country"
    t.boolean "host", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
