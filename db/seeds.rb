# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
if Rails.env.production?
  puts "Can't run seeds in production"
  exit 1
end

u = User.new(email_address: "u@mail.com")
u.password = "password"
u.save!

users_in_random_order = User.order(Arel.sql("RANDOM()"))
5.times do
  Badge.create!(
    title: "#{Faker::Lorem.word} #{rand(100)}",
    description: Faker::Lorem.sentence,
    badge_image: Rails.root.join("app/assets/images/#{rand(1..40)}.png").open,
  )
end

users_in_random_order.limit(10).each do |user|
  user.badge_achievements.create!(
    badge: Badge.order(Arel.sql("RANDOM()")).limit(1).take,
    rewarding_context_message_markdown: Faker::Markdown.random,
  )
end


podcast = Podcast.create!(
  title: "#{Faker::Music.band} Show",
  description: Faker::Lorem.paragraph,
  user: User.first
)

2.times do |sno|
  10.times do |eno|
    podcast.episodes.create!(title: Faker::Book.title, episode_number: eno, season_number: sno)
  end
end

# Episode.create!(podcast: podcast)


# User.all.in_batch()


50.times do
  Article.create!(
    cached_user_username: Faker::Internet.username,
    page_views_count: Faker::Number.between(from: 0, to: 5000),
    path: "/#{Faker::Internet.slug}",
    user_id: User.all.sample.id,
    title: Faker::Book.title,
    body_markdown: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
    language: Faker::ProgrammingLanguage.name,
    featured: Faker::Boolean.boolean,
    published: Faker::Boolean.boolean,
    published_at: Faker::Time.between(from: 2.years.ago, to: Time.now),
    created_at: Faker::Time.between(from: 3.years.ago, to: 1.year.ago),
    updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
    slug: Faker::Internet.slug
  )
end


Article.create!(
  cached_user_username: Faker::Internet.username,
  page_views_count: Faker::Number.between(from: 0, to: 5000),
  path: "/#{Faker::Internet.slug}",
  user_id: User.all.sample.id,
  title: "How to start a podcast",
  body_markdown: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
  language: Faker::ProgrammingLanguage.name,
  featured: Faker::Boolean.boolean,
  published: Faker::Boolean.boolean,
  published_at: Faker::Time.between(from: 2.years.ago, to: Time.now),
  created_at: Faker::Time.between(from: 3.years.ago, to: 1.year.ago),
  updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
  slug: Faker::Internet.slug
)


categories = [
  "Technology",
  "Health",
  "Education",
  "Travel",
  "Food",
  "Finance",
  "Lifestyle",
  "Help"
]

categories.each do |name|
  Category.find_or_create_by(name: name)
end

ActiveRecord::Base.transaction do
  published = Faker::Boolean.boolean
  published_at = Faker::Time.between(from: 2.years.ago, to: Time.now) if published
  10.times do |_|
    article = Article.create!(
      cached_user_username: Faker::Internet.username,
      page_views_count: Faker::Number.between(from: 0, to: 5000),
      path: "/#{Faker::Internet.slug}",
      user_id: User.all.sample.id,
      title: "How to start a podcast",
      body_markdown: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
      language: Faker::ProgrammingLanguage.name,
      featured: Faker::Boolean.boolean,
      published: published,
      published_at: published_at,
      created_at: Faker::Time.between(from: 3.years.ago, to: 1.year.ago),
      updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
    )

    ArticleCategory.create!(article: article, category: Category.find_by(name: "help"))
  end
end

[ "directory", "feature", "stats", "faq", "troubleshoot", "subscriptions", "embedding" ].each do |subcategory|
  Category.create(name: subcategory, parent: Category.find_by(name: "help"))
end


1000.times.each do |_|
  timestamp = Faker::Time.between(from: 7.days.ago, to: Time.now)
  Download.create!(
    episode: Episode.all.sample,
    created_at: timestamp,
    downloaded_at: timestamp,
    ip_address: Faker::Internet.ip_v4_address,
    user_agent: Faker::Internet.user_agent
  )
end

5000.times.each do |_|
  timestamp = Faker::Time.between(from: 90.days.ago, to: Time.now)
  Download.create!(
    episode: Episode.where(podcast_id: User.first.podcasts.map(&:id)).sample,
    created_at: timestamp,
    downloaded_at: timestamp,
    ip_address: Faker::Internet.ip_v4_address,
    user_agent: Faker::Internet.user_agent
  )
end
# Article.where(published: true).update_all(published_at: Faker::Time.between(from: 2.years.ago, to: Time.now))
# Article.where(published: false).update_all(published_at: nil)
# Category.find_by(name: "help").articles.each do |article|
# article.update!(title: Faker::Book.title)
# end
