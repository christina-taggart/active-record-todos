require 'csv'
require_relative '../app/models/task'

class TaskImporter
  def self.import(filename = '/Users/apprentice/david_henry/activerecord-todos-part-1-challenge/source/ar_todos/db/data/tasks_list.csv')

    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      task_data = {}
      row.each do |column_name, value|
        task_data[column_name.to_sym] = value
      end
      temp = Task.new(task_data)
      temp.save!
    end
  end
end

TaskImporter.import
