class User < ApplicationRecord
  include Users::Avatarable, Users::RansackableAttributes
  rolify strict: true
  has_secure_password

  has_one :setting, class_name: "Users::Setting", dependent: :delete
  has_one :notification_setting, class_name: "Users::NotificationSetting", dependent: :delete

  has_many :sessions, dependent: :destroy
  has_many :impersonator_support_sessions, class_name: "ImpersonationSession", foreign_key: :impersonator_id, dependent: :destroy
  has_many :impersonated_support_sessions, class_name: "ImpersonationSession", foreign_key: :impersonated_id, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :podcasts, dependent: :destroy
  has_many :badge_achievements, dependent: :delete_all
  has_many :badge_achievements_rewarded, class_name: "BadgeAchievement", foreign_key: :rewarder_id, inverse_of: :rewarder, dependent: :nullify
  has_many :badges, through: :badge_achievements
  has_many :ahoy_events, class_name: "Ahoy::Event", dependent: :delete_all
  has_many :ahoy_visits, class_name: "Ahoy::Visit", dependent: :delete_all
  has_many :searches, dependent: :delete_all
  has_many :downloads

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, uniqueness: true
  before_validation :set_username
  before_create :create_users_settings

  def set_username
    self.username = username&.downcase.presence || generate_username
  end

  def create_users_settings
    self.setting = Users::Setting.create
  end

  def generate_username
    self.username = loop do
      username = SecureRandom.hex(64)
      break username unless self.class.exists?(username: username)
    end
  end

  def request_impersonation_for(user_id)
    impersonated = User.find(user_id)
    impersonator_support_sessions.create!(impersonated: impersonated)
  end

  def initials
    if first_name.present? && last_name.present?
      "#{first_name.first}#{last_name.first}".upcase
    else
      initial
    end
  end

  def twitter_url
    "https://twitter.com/#{twitter_username}" if twitter_username.present?
  end

  def github_url
    "https://github.com/#{github_username}" if github_username.present?
  end


  def purge_later
    Users::PurgeJob.perform_later(self.id)
  end
end
