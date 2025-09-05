class CreateClicks < ActiveRecord::Migration[8.0]
  def change
    create_table :clicks do |t|
      t.references :link, foreign_key: true
      t.string :ip_address
      t.string :user_agent
      t.datetime :clicked_at
      t.timestamps
    end
  end
end
