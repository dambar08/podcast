class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ index features pricing subscriptions stats ]

  def index
  end

  def features
  end

  def pricing
  end

  def subscriptions
  end

  def stats
  end
end
