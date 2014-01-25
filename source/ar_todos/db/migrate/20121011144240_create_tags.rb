require_relative '../../config/application.rb'

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :body

      t.timestamps
    end
  end
end