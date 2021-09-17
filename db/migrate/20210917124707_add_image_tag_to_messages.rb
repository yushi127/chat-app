class AddImageTagToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user_icon, :string
  end
end
