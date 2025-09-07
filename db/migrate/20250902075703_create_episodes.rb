class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :podcast
      t.string :title
      t.boolean :expicit_content,  default: false, null: false
      t.timestamps
    end
  end
end
