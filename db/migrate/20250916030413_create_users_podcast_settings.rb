class CreateUsersPodcastSettings < ActiveRecord::Migration[8.0]
  def self.up
    create_table :users_podcast_settings do |t|
      t.belongs_to :podcast
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :users_podcast_settings, %i[var podcast_id], unique: true
  end

  def self.down
    drop_table :users_podcast_settings
  end
end
