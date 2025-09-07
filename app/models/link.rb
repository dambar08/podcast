class Link < ApplicationRecord
  belongs_to :podcast
  has_many :clicks, dependent: :destroy

  enum link_type: {
    facebook: "facebook",
    linkedin: "linkedin",
    twitter:  "twitter",
    youtube:  "youtube",
    support:  "support"
  }

  VALID_URL_PATTERNS = {
    facebook: %r{\Ahttps?://(www\.)?facebook\.com/}i,
    linkedin: %r{\Ahttps?://(www\.)?linkedin\.com/}i,
    twitter:  %r{\Ahttps?://(www\.)?twitter\.com/}i,
    youtube:  %r{\Ahttps?://(www\.)?(youtube\.com|youtu\.be)/}i,
    support:  %r{\Ahttps?://}i # plain valid URL
  }

  validates :url, presence: true
  validates :link_type, presence: true, inclusion: { in: VALID_URL_PATTERNS.keys.map(&:to_s) }
  validate :url_matches_link_type

  private

  def url_matches_link_type
    return if url.blank? || link_type.blank?

    pattern = VALID_URL_PATTERNS[link_type.to_sym]
    unless url.match?(pattern)
      errors.add(:url, "does not match expected format for #{link_type}")
    end
  end
end
