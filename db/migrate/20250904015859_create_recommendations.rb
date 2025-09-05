class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :user
      t.bigint :recommendable_id
      t.bigint :recommendable_type
      t.string :reason
      t.timestamps
    end
  end
end
