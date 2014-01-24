require_relative '../../config/application'



class CreateTasks < ActiveRecord::Migration
  def change
    create_table(:tasks) do |t|
      t.string :name
      t.integer :complete
      t.timestamps
    end
  end

end