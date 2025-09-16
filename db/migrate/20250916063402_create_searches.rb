class CreateSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :searches do |t|
      t.belongs_to :user
      t.string :query, null: false
      t.timestamps
    end
  end
end
