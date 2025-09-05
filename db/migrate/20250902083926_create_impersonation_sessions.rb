class CreateImpersonationSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :impersonation_sessions do |t|
      t.references :impersonator, null: false, foreign_key: { to_table: :users }
      t.references :impersonated, null: false, foreign_key: { to_table: :users }
      t.string :status, null: false, default: 'pending'
      t.timestamps
    end
  end
end
