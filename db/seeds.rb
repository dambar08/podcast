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

podcast = Podcast.create!(title: "", description: "", user: User.find(1))
Episode.create!(podcast: podcast)


# User.all.in_batch()
