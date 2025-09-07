class CreateBadges < ActiveRecord::Migration[8.0]
  def change
    create_table :badges do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.timestamps
    end

    add_index :badges, :slug, unique: true
    add_index :badges, :title, unique: true
  end
end
