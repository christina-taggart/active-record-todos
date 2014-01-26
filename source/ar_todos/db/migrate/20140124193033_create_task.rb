class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.string :done
      t.string :description
      t.string :tag
      t.datetime :completion_date
      t.timestamps
    end
  end
end
