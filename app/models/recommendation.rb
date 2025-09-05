class Recommendation < ApplicationRecord
  ALLOWED_POLYMORPIC_MODELS = [ "Episode " ].freeze
  belongs_to :user
  belongs_to :recommendable, polymorphic: true

  validates :recommendable_type, inclusion: { in: ALLOWED_POLYMORPIC_MODELS }
end
