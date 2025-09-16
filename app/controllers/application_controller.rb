class ApplicationController < ActionController::Base
  include AllowBrowser, Authentication, Pagy::Backend, Pundit::Authorization

  skip_before_action :track_ahoy_visit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found
    raise ActiveRecord::RecordNotFound, "Not Found"
  end

  def user_not_authorized
    raise Pundit::NotAuthorizedError, "You are not authorized to perform this action."
  end
end
