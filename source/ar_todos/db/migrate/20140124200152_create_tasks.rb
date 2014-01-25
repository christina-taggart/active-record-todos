require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :list, default: 1
      t.string :description
      t.integer :completed
    end
  end
end
