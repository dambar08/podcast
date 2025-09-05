class Users::Setting < ApplicationRecord
  self.table_name_prefix = "users_"

  HEX_COLOR_REGEXP = /\A#?(?:\h{6}|\h{3})\z/.freeze

  belongs_to :user, touch: true
  # enum config_font: { default: 0, comic_sans: 1, monospace: 2, open_dyslexic: 3, sans_serif: 4, serif: 5 }# , _suffix: :font
  # enum config_theme: { light_theme: 0, dark_theme: 2 }

  validates :brand_color1, format: { with: HEX_COLOR_REGEXP, message: I18n.t("models.users.setting.invalid_hex") }
end
