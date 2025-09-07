class NotifyMailer < ApplicationMailer
  def account_deleted_email
    @name = params[:name]

    subject = I18n.t("mailers.notify_mailer.account_deleted")
    mail(to: params[:email], subject: subject)
  end

  def new_badge_email
    @badge_achievement = params[:badge_achievement]
    @user = @badge_achievement.user
    @badge = @badge_achievement.badge
    @unsubscribe = generate_unsubscribe_token(@user.id, :email_badge_notifications)

    mail(to: @user.email, subject: I18n.t("mailers.notify_mailer.new_badge"))
  end
end
