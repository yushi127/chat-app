class CreateExpultions < ActiveRecord::Migration[5.2]
  def change
    create_table :expultions do |t|
      t.references :user, foreign_key: true

      t.text :reason

      t.timestamps
    end
  end
end
  # belongs_to :allplan, foreign_key: 'allplan_id'
  # has_many :result_todos
