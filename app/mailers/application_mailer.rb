class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  helper Rails.application.routes.url_helpers
  helper ApplicationHelper

  def generate_unsubscribe_token(id, email_type)
    Rails.application.message_verifier(:unsubscribe).generate({ user_id: id, email_type: email_type.to_sym, expires_at: 31.days.from_now })
  end
end
