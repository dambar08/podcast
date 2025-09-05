class CreateUsersSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :users_settings do |t|
      t.belongs_to :user
      t.string :brand_color1, default: "#000000"
      t.integer :config_font, default: 0, null: false
      t.integer :config_theme, default: 0, null: false
      t.timestamps
    end
  end
end
