class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string "color", default: "#6172F3", null: false
      t.string :slug
      t.belongs_to :parent, foreign_key: { to_table: :categories }, null: true
      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
