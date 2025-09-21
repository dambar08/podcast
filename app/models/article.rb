class Article < ApplicationRecord
  extend FriendlyId

  include PgSearch::Model
  include Readable

  friendly_id :title, use: :slugged

  acts_as_taggable_on :tags

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  delegate :username, to: :user, prefix: true

  before_validation :normalize_title

  before_save :detect_language
  before_save :set_caches

  scope :not_authored_by, ->(user_id) { where.not(user_id: user_id) }
  scope :authored_by, ->(user_id) { where(user_id: user_id) }
  scope :published, lambda {
    where(published: true)
      .where("published_at <= ?", Time.current)
  }
  scope :unpublished, -> { where(published: false) }
  scope :featured, -> { where(featured: true) }
  scope :feed, lambda {
                 published.includes(:taggings)
                   .select(
                     :id, :published_at, :user_id, :title, :path,
                   )
               }

  scope :sorting, lambda { |value|
    value ||= "creation-desc"
    kind, dir = value.split("-")

    dir = "desc" unless %w[asc desc].include?(dir)

    case kind
    when "creation"
      order(created_at: dir)
    when "views"
      order(page_views_count: dir)
    when "published"
      # NOTE: For recently published, we further filter to only published posts
      order(published_at: dir).published
    else
      order(created_at: dir)
    end
  }

  def detect_language
    return unless title_changed? || body_markdown_changed?

    self.language = Languages::Detection.call("#{title}. #{body_text}")
  end

  def username
    user.username
  end

  def calculated_path
    "/#{username}/#{slug}"
  end

  def skip_indexing?
    false
  end

  def set_caches
    return unless user

    self.cached_user_username = user_username
    self.path = calculated_path.downcase
  end

  def normalize_title
    return unless title

    self.title = title
    #   .gsub(TITLE_CHARACTERS_ALLOWED, " ")
    #   # Coalesce runs of whitespace into a single space character
    #   .gsub(/\s+/, " ")
    #   .strip
  end
end
