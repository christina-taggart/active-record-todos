require 'csv'
require_relative '../app/models/task'

class TaskImporter
  def self.import(filename)
    tasks =  CSV.read(filename).flatten
    tasks.each { |task| Task.create!(list_id: 1, description: task) }
  end
end

class ListImporter
  def self.import(filename)
    lists = CSV.read(filename).flatten
    lists.each { |list| List.create!(name: list) }
  end
end