class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  COLORS = %w[#e99537 #4da568 #6471eb #db5a54 #df4e92 #c44fe9 #eb5429 #61c9ea #805dee #6ad28a]

  UNCATEGORIZED_COLOR = "#737373"
  TRANSFER_COLOR = "#444CE7"
  PAYMENT_COLOR = "#db5a54"
  TRADE_COLOR = "#e99537"

  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: :parent_id, dependent: :destroy
  has_many :article_categories
  has_many :articles, through: :article_categories

  scope :alphabetically, -> { order(:name) }
  scope :roots, -> { where(parent_id: nil) }

  normalizes :name, with: ->(e) { e.strip.downcase }

  validates :name, :color, presence: true

  class Group
    attr_reader :category, :subcategories

    delegate :name, :color, to: :category

    def self.for(categories)
      categories.select { |category| category.parent_id.nil? }.map do |category|
        new(category, category.subcategories)
      end
    end

    def initialize(category, subcategories = nil)
      @category = category
      @subcategories = subcategories || []
    end
  end

  def parent?
    subcategories.any?
  end

  def subcategory?
    parent.present?
  end
end
