class Podcast < ApplicationRecord
  belongs_to :user

  has_one :setting, class_name: "Users::PodcastSetting", dependent: :delete
  has_many :episodes, dependent: :destroy
  has_many :links, dependent: :destroy

end
