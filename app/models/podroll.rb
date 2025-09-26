class Podroll < ApplicationRecord
  ALLOWED_POLYMORPIC_MODELS =  [ "Podcast", "Episode" ].freeze
  private_constant :ALLOWED_POLYMORPIC_MODELS

  belongs_to :podcast
  belongs_to :podrollable, polymorphic: true

  delegate :user, to: :podcast

  validates :podrollable_type, inclusion: { in: ALLOWED_POLYMORPIC_MODELS }
end
