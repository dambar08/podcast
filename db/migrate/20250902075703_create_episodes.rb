class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :podcast
      t.string :title
      t.string :description
      t.string :summary
      t.datetime :published_at
      t.integer :episode_number, null: false
      t.integer :season_number, null: false
      t.boolean :explicit, default: false, null: false
      t.timestamps
    end
  end
end
