class Notification < ApplicationRecord
  ALLOWED_POLYMORPIC_MODELS =  [ "" ].freeze
  private_constant :ALLOWED_POLYMORPIC_MODELS

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  validates :user_id, uniqueness: { scope: [ :notifiable_id, :notifiable_type, :action ] }
  validates :notifiable_type, inclusion: { in: ALLOWED_POLYMORPIC_MODELS }

  before_create :mark_notified_at_time

  def send_new_badge_achievement_notification(badge_achievement)
    Notifications::NewBadgeAchievementJob.perform_async(badge_achievement.id)
  end

  private
  def mark_notified_at_time
    self.notified_at = Time.current
  end
end
