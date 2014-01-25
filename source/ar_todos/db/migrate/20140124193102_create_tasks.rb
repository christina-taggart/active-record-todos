class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed, default: false
      t.belongs_to :list, default: 1
      t.timestamps
    end
  end
end
