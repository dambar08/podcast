class Episode < ApplicationRecord
  # has_rich_text :description

  belongs_to :podcast
  has_many :notifications, as: :notifiable
  has_many :recommendations, as: :recommendable

  delegate :user, to: :podcast
  alias_method :author, :user

  validates :title, :episode_number, :season_number, presence: true
  validates :episode_number, uniqueness: { scope: [:podcast_id, :season_number] }
end
