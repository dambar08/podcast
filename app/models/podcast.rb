class Podcast < ApplicationRecord
  include Podcasts::Backgroundable, Podcasts::Artworkable

  belongs_to :user

  has_one :setting, class_name: "Users::PodcastSetting", dependent: :destroy
  has_many :episodes, dependent: :destroy
  has_many :links, dependent: :destroy

  alias_method :author, :user

  validates :title, presence: true
  validates :explicit, presence: true
end
