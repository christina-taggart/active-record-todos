require_relative '../config'

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |col|
      col.string :name
      col.timestamps
    end
  end
end