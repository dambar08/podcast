source "https://rubygems.org"


gem "rails", "~> 8.0.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "propshaft" # The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "puma", ">= 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "tzinfo-data", platforms: %i[ windows jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "solid_cache" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "kamal", require: false # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "thruster", require: false # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "dotenv-rails", "~> 3.1"
  gem "faker", "~> 3.5"
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 8.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "listen", "~> 3.9"
  gem "active_record_query_trace", "~> 1.8"
  gem "better_errors", "~> 2.10"
  gem "binding_of_caller", "~> 1.0"
  gem "i18n-tasks", "~> 1.0"
  gem "hotwire-livereload", "~> 2.0"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "pundit-matchers", "~> 4.0"
  gem "shoulda-matchers", "~> 6.5"
  gem "rspec-retry", "~> 0.6.2"
  gem "timecop", "~> 0.9.10"
  gem "with_model", "~> 2.2"
  gem "webmock", require: false
end

gem "pundit", "~> 2.5"
gem "rolify", "~> 6.0"
gem "acts-as-taggable-on", "~> 12.0"
gem "pg_search", "~> 2.3"
gem "friendly_id", "~> 5.5"
gem "stripe", "~> 15.5"
gem "ahoy_matey", "~> 5.4"
gem "rack-timeout", "~> 0.7.0"
gem "rack-cors", "~> 3.0"
gem "warning", "~> 1.5"
gem "pagy", "~> 9.4"
gem "redcarpet", "~> 3.6"
gem "active_storage_validations", "~> 3.0"
gem "rails-settings-cached", "~> 2.9"
gem "rqrcode", "~> 3.1"
gem "cld3", "~> 3.7"
gem "addressable", "~> 2.8"
gem "validate_url", "~> 1.0"
gem "platform_agent", "~> 1.0"
gem "pg_query", "~> 6.1"
gem "chartkick", "~> 5.2"
gem "pghero", "~> 3.7"
gem "whenever", "~> 1.0"
gem "rouge", "~> 4.6"
gem "nokogiri", "~> 1.18"
gem "draper", "~> 4.0"
