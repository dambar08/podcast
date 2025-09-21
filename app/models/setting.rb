# RailsSettings Model
# Application Config from database
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
  scope :general do
    field :meta_keywords, type: :hash, default: {
      default: nil,
      article: nil,
      tag: nil
    }

    field :main_social_image,
      type: :string,
      default: proc {
        host ||= ActionController::Base.asset_host || "http://localhost:3000"
        ActionController::Base.helpers.image_url("social-media-cover.png", host: host)
       },
      validates: { url: true }

    field :social_media_handles, type: :hash, default: {
      twitter: nil,
      facebook: nil,
      github: nil,
      instagram: nil,
      twitch: nil,
      mastodon: nil,
      youtube: nil,
      linkedin: nil,
      bluesky: nil
    }

    field :social_media_handles, type: :hash, default: {
      twitter: nil,
      facebook: nil,
      discord: nil,
      mastodon: nil,
      instagram: nil,
      tiktok: nil,
      youtube: nil
    }
  end
end
