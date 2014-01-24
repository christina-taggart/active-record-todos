class AddStartingTables < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :is_completed, :list_id

      t.timestamps
    end

    create_table :lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
