class CreatePodrolls < ActiveRecord::Migration[8.0]
  def change
    create_table :podrolls do |t|
      t.belongs_to :podcast
      t.belongs_to :podrollable, polymorphic: true
      t.timestamps
    end
  end
end
