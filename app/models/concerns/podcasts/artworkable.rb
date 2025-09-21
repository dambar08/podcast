module Podcasts::Artworkable
  extend ActiveSupport::Concern

  included do
    has_one_attached :artwork
  end

  class_methods do
    def from_background_token(sid)
      find_signed!(sid, purpose: :artwork)
    end
  end

  def background_token
    signed_id(purpose: :artwork)
  end
end
