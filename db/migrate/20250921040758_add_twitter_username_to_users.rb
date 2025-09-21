class AddTwitterUsernameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :twitter_username, :string
  end
end
