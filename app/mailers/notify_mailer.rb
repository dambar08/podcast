class NotifyMailer < ApplicationMailer
  def account_deleted_email
    @name = params[:name]

    subject = I18n.t("mailers.notify_mailer.account_deleted", community: Settings::Community.community_name)
    mail(to: params[:email], subject: subject)
  end
end
