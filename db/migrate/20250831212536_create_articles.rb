class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :cached_user_username
      t.bigint :page_views_count, default: 0
      t.string :path
      t.belongs_to :user
      t.string :title
      t.text :body_markdown
      t.string :language
      t.boolean :featured
      t.boolean :published
      t.datetime :published_at
      t.timestamps
    end

    add_index(:articles, :published)
    add_index(:articles, :published_at)
    add_index(:articles, :featured)
  end
end
