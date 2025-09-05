class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.string :action
      t.bigint :notifiable_id
      t.string :notifiable_type
      t.datetime :notified_at
      t.datetime :read_at
      t.datetime :seen_at
      t.jsonb :json_data
      t.timestamps
    end

    add_index :notifications, [ :notifiable_id, :notifiable_type ]
  end
end
