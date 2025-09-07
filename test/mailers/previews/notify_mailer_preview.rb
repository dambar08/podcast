# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/notify_mailer/account_deleted_email
  def account_deleted_email
    user = User.take
    NotifyMailer.with(name: user.username, email: user.email).account_deleted_email
  end
end
