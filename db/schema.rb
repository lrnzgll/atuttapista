# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_17_194313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_locations", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "postal_code"
    t.float "latitude"
    t.float "longitude"
    t.bigint "town_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["town_id"], name: "index_address_locations_on_town_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "address_location_id"
    t.time "archived_at"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_location_id"], name: "index_addresses_on_address_location_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_counties_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "county_routes", force: :cascade do |t|
    t.bigint "county_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_county_routes_on_county_id"
    t.index ["route_id"], name: "index_county_routes_on_route_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_kinds_on_route_id"
  end

  create_table "place_of_interests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_place_of_interests_on_county_id"
  end

  create_table "region_routes", force: :cascade do |t|
    t.bigint "region_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_region_routes_on_region_id"
    t.index ["route_id"], name: "index_region_routes_on_route_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "route_locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_locations_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "difficulty"
    t.float "distance"
    t.string "gpx"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.integer "views_counter", default: 0
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "surfaces", force: :cascade do |t|
    t.string "name"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_surfaces_on_route_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.bigint "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_towns_on_county_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "moderator"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "address_locations", "towns"
  add_foreign_key "addresses", "address_locations"
  add_foreign_key "counties", "regions"
  add_foreign_key "county_routes", "counties"
  add_foreign_key "county_routes", "routes"
  add_foreign_key "kinds", "routes"
  add_foreign_key "place_of_interests", "counties"
  add_foreign_key "region_routes", "regions"
  add_foreign_key "region_routes", "routes"
  add_foreign_key "regions", "countries"
  add_foreign_key "route_locations", "routes"
  add_foreign_key "routes", "users"
  add_foreign_key "surfaces", "routes"
  add_foreign_key "towns", "counties"
end
