class Episode < ApplicationRecord
  has_rich_text :description

  belongs_to :podcast
  has_many :notifications, as: :notifiable
  has_many :recommendations, as: :recommendable

  delegate :user, to: :podcast
end
