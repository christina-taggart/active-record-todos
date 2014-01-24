class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |col|
      col.integer :list_id
      col.string :description
      col.boolean :completed, default: false
      col.timestamps
    end
  end
end
