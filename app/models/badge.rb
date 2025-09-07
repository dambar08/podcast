class Badge < ApplicationRecord
  has_one_attached :badge_image
  has_many :badge_achievements, dependent: :restrict_with_error
  has_many :users, through: :badge_achievements

  validates :description, presence: true
  validates :slug, presence: true
  validates :title, presence: true, uniqueness: true

  before_validation :generate_slug

  validates :badge_image, attached: false, content_type: { with: [ "image/jpg", "image/webp", "image/png", "image/jpeg", "image/gif" ], spoofing_protection: true }, dimension: { width: { min: 1280, max: 2280 }, height: { min: 648, max: 1648 } }, size: { less_than: 8.megabytes }

  def self.id_for_slug(slug)
    select(:id).find_by(slug: slug)&.id
  end

  def path
    "/badge/#{slug}"
  end

  private

  def generate_slug
    self.slug = CGI.escape(title.to_s).parameterize
  end
end
