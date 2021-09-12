class AddExpulsionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expulsion, :integer
  end
end
