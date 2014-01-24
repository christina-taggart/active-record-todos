require_relative '../config'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |col|
      col.string :task_text
      col.integer :done
      col.integer :list_id
      col.timestamps
    end
  end
end