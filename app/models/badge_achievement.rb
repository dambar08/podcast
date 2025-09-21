class BadgeAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :rewarder, class_name: "User", optional: true

  delegate :slug, to: :badge, prefix: true
  delegate :title, to: :badge, prefix: true

  validates :badge_id, uniqueness: { scope: :user_id }

  # before_validation :render_rewarding_context_message_html
  after_create_commit :notify_recipient
  after_create_commit :send_email_notification

  private

  def render_rewarding_context_message_html
    return unless rewarding_context_message_markdown

    parsed_markdown = MarkdownProcessor::Parser.new(rewarding_context_message_markdown)
    html = parsed_markdown.finalize
    final_html = ActionController::Base.helpers.sanitize(
      html,
      tags: MarkdownProcessor::AllowedTags::BADGE_ACHIEVEMENT_CONTEXT_MESSAGE,
      attributes: MarkdownProcessor::AllowedAttributes::BADGE_ACHIEVEMENT_CONTEXT_MESSAGE,
    )

    self.rewarding_context_message = final_html
  end

  def notify_recipient
    Notification.send_new_badge_achievement_notification(self)
  end

  def send_email_notification
    return unless user.is_a?(User)
    return unless user.email && user.notification_setting.email_badge_notifications

    BadgeAchievements::SendEmailNotificationJob.perform_async(id)
  end
end
