class HelpsController < ApplicationController
  allow_unauthenticated_access

  def show
    parent = Category.find_by(name: "help")
    @categories = Category.where(parent: parent) if parent.present?
    @categories ||= Category.none
    @categories = @categories.decorate
    @articles = Article.published.for_help.order("RANDOM()").take(5)
  end
end
