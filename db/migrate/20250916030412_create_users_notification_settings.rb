class CreateUsersNotificationSettings < ActiveRecord::Migration[8.0]
  def self.up
    create_table :users_notification_settings do |t|
      t.belongs_to :user
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :users_notification_settings, %i[var user_id], unique: true
  end

  def self.down
    drop_table :users_notification_settings
  end
end
