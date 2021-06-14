class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.integer :userid
      t.integer :roomid

      t.timestamps
    end
  end
end
