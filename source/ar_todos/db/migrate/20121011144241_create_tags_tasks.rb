require_relative '../../config/application.rb'

class CreateTagsTasks < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :task_id
      t.integer :tag_id
      t.datetime :completed_at

      t.timestamps
    end
  end
end