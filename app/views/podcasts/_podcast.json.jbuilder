json.extract! podcast, :id, :user_id, :title, :description, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
