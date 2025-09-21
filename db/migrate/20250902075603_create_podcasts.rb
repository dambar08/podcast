class CreatePodcasts < ActiveRecord::Migration[8.0]
  def change
    create_table :podcasts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :explicit, default: false, null: false
      t.timestamps
    end

    add_index :podcasts, :explicit
  end
end
