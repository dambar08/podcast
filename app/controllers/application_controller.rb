class ApplicationController < ActionController::Base
  include Authentication
  include Pagy::Backend
  include Pundit::Authorization

  skip_before_action :track_ahoy_visit
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found
    raise ActiveRecord::RecordNotFound, "Not Found"
  end

  def user_not_authorized
    raise Pundit::NotAuthorizedError, "You are not authorized to perform this action."
  end
end
