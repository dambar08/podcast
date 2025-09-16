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

ActiveRecord::Schema[8.0].define(version: 2025_09_16_063402) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
    t.index ["visitor_token", "started_at"], name: "index_ahoy_visits_on_visitor_token_and_started_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string "cached_user_username"
    t.bigint "page_views_count", default: 0
    t.string "path"
    t.bigint "user_id"
    t.string "title"
    t.text "body_markdown"
    t.string "language"
    t.boolean "featured"
    t.boolean "published"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["featured"], name: "index_articles_on_featured"
    t.index ["published"], name: "index_articles_on_published"
    t.index ["published_at"], name: "index_articles_on_published_at"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "badge_achievements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "rewarder_id"
    t.bigint "badge_id"
    t.text "rewarding_context_message"
    t.text "rewarding_context_message_markdown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_badge_achievements_on_badge_id"
    t.index ["rewarder_id"], name: "index_badge_achievements_on_rewarder_id"
    t.index ["user_id", "badge_id"], name: "index_badge_achievements_on_user_id_and_badge_id"
    t.index ["user_id"], name: "index_badge_achievements_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_badges_on_slug", unique: true
    t.index ["title"], name: "index_badges_on_title", unique: true
  end

  create_table "clicks", force: :cascade do |t|
    t.bigint "link_id"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "clicked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_clicks_on_link_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "podcast_id"
    t.string "title"
    t.boolean "expicit_content", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["podcast_id"], name: "index_episodes_on_podcast_id"
  end

  create_table "impersonation_sessions", force: :cascade do |t|
    t.bigint "impersonator_id", null: false
    t.bigint "impersonated_id", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["impersonated_id"], name: "index_impersonation_sessions_on_impersonated_id"
    t.index ["impersonator_id"], name: "index_impersonation_sessions_on_impersonator_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "podcast_id"
    t.string "link_type", null: false
    t.string "title", null: false
    t.string "url", null: false
    t.integer "position", default: 0
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["podcast_id"], name: "index_links_on_podcast_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "action"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "notified_at"
    t.datetime "read_at"
    t.datetime "seen_at"
    t.jsonb "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_podcasts_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recommendable_id"
    t.bigint "recommendable_type"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "user_id"
    t.string "query", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_notification_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_notification_settings_on_user_id"
    t.index ["var", "user_id"], name: "index_users_notification_settings_on_var_and_user_id", unique: true
  end

  create_table "users_podcast_settings", force: :cascade do |t|
    t.bigint "podcast_id"
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["podcast_id"], name: "index_users_podcast_settings_on_podcast_id"
    t.index ["var", "podcast_id"], name: "index_users_podcast_settings_on_var_and_podcast_id", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "users_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "brand_color1", default: "#000000"
    t.integer "config_font", default: 0, null: false
    t.integer "config_theme", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_settings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "badge_achievements", "badges"
  add_foreign_key "badge_achievements", "users"
  add_foreign_key "badge_achievements", "users", column: "rewarder_id"
  add_foreign_key "clicks", "links"
  add_foreign_key "impersonation_sessions", "users", column: "impersonated_id"
  add_foreign_key "impersonation_sessions", "users", column: "impersonator_id"
  add_foreign_key "links", "podcasts"
  add_foreign_key "podcasts", "users"
  add_foreign_key "sessions", "users"
end
