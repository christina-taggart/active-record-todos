require_relative '../../config/application'

class CreateLists < ActiveRecord::Migration

  def change
    create_table :lists do |t|
      t.string :type
      t.timestamps
    end
  end
end
