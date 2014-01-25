require_relative '../../config/application.rb'

class CreateTasks < ActiveRecord::Migration

  def change
    create_table :tasks do |t|
      t.string :body
      t.integer :completed

      t.integer :list_id

      t.timestamps
    end
  end
end