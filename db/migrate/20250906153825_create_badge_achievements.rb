class CreateBadgeAchievements < ActiveRecord::Migration[8.0]
  def change
    create_table :badge_achievements do |t|
      t.belongs_to :user, foreign_key: true
      t.references :rewarder, null: true, foreign_key: { to_table: :users }
      t.belongs_to :badge, foreign_key: true
      t.text :rewarding_context_message
      t.text :rewarding_context_message_markdown
      t.timestamps
    end

    add_index :badge_achievements, [ :user_id, :badge_id ]
  end
end
