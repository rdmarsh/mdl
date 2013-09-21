class AddAvatarUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :avatar_url, :string
  end
end
