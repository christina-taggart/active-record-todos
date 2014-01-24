require 'csv'

List.create(name: "stuff")
Task.create(description: "eat chips", list_id: 1)

tasks_array = []
CSV.foreach(File.dirname(__FILE__) + "/../db/data/todo_out.csv") do |row|
  Task.create(description: row[0], list_id: 1, is_completed: 0)
end