class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_icon, :string
  end
end
