class Users::PurgeJob < ApplicationJob
  queue_as :low

  def perform(user_id, admin_delete = false)
    user = User.find_by(id: user_id)
    return unless user

    Users::Delete.call(user)

    return if admin_delete || user.email.blank?

      NotifyMailer.with(name: user.name, email: user.email).account_deleted_email.deliver_now
  end
end
