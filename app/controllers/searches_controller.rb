class SearchesController < ApplicationController
  def show
    policy_scope(Article)
  end
end
