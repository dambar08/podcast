class Episode < ApplicationRecord
  has_rich_text :description

  belongs_to :user
  has_many :notifications, as: :notifiable
  has_many :recommendations, as: :recommendable
end
