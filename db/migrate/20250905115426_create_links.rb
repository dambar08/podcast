class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.string :url, null: false
      t.integer :position, default: 0
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
