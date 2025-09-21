module Article::Searhable
  extend ActiveSupport::Concern

  included do
    include PgSearch::Model
  end
end
