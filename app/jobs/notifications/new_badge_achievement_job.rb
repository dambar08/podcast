class Notifications::NewBadgeAchievementJob < ApplicationJob
  queue_as :default

  def perform(badge_achievement_id)
    def perform(badge_achievement_id)
      badge_achievement = BadgeAchievement.find_by(id: badge_achievement_id)
      Notifications::NewBadgeAchievement::Send.call(badge_achievement) if badge_achievement
    end
  end
end
