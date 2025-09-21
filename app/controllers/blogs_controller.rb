class BlogsController < ApplicationController
  def show
    @pagy, @articles = pagy(Article.feed.order(published_at: :desc), items: 12)
  end
end
