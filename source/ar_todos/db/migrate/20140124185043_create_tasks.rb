class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |col|
      col.integer :list_id
      col.string :description
      col.boolean :completed
      col.timestamps
    end
  end
end
