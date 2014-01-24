require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :status
      t.date :date_completed
      t.string :difficulty

      t.timestamp :created_at
    end
  end
end
