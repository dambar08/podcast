class CreateDownloads < ActiveRecord::Migration[8.0]
  def change
    create_table :downloads do |t|
      t.belongs_to :user, foreign_key: true, null: true
      t.belongs_to :episode
      t.datetime :downloaded_at, null: false
      t.string :domain
      t.string :path
      t.string :referrer
      t.string :user_agent
      t.string :ip_address
      t.timestamps
    end

    add_index(:downloads, :downloaded_at)
  end
end
