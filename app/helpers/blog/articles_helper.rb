module Blog::ArticlesHelper
  def meta_keywords_article(article_tags = nil)
    return if Settings::General.meta_keywords[:article].blank?

    content = if article_tags.present?
                "#{article_tags}, #{Settings::General.meta_keywords[:article]}"
    else
                Settings::General.meta_keywords[:article]
    end

    tag.meta name: "keywords", content: content
  end
end
