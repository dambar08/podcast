module ApplicationHelper
  include Pagy::Frontend

  # Renders Markdown text using Redcarpet
  def markdown(text)
    return "" if text.blank?

    renderer = Redcarpet::Render::HTML.new(
      hard_wrap: true,
      link_attributes: { target: "_blank", rel: "noopener noreferrer" }
    )

    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true
    )

    markdown.render(text).html_safe
  end

  def app_url(uri = nil)
    base_url = "http://localhost" # TODO Change to support production
    base_url += ":3000" if Rails.env.development? && !base_url.include?(":3000")
    return base_url unless uri
    Addressable::URI.parse(base_url).join(uri).normalize.to_s
  end

  def meta_keywords_default
    return if Setting.meta_keywords[:default].blank?

    tag.meta name: "keywords", content: Setting.meta_keywords[:default]
  end

  def community_name
    "My Podcast"
  end

  def community_description
    "What is this podcast about?"
  end
end
