module Podcasts::Backgroundable
  extend ActiveSupport::Concern

  included do
    has_one_attached :background
  end

  class_methods do
    def from_background_token(sid)
      find_signed!(sid, purpose: :background)
    end
  end

  def background_token
    signed_id(purpose: :background)
  end
end
