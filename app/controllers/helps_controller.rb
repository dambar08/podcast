class HelpsController < ApplicationController
  allow_unauthenticated_access

  def show
    @pagy, @articles = pagy(Article.published.for_help)
  end
end
