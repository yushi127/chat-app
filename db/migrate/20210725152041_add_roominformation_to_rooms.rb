class AddRoominformationToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :department, :string
    add_column :rooms, :semester, :string
  end
end
