require 'faker'


require_relative '../app/models/task'


module TasksImporter
 def self.import
   10.times do
    task_name = Faker::Lorem.sentence
    attribute_hash = {name: task_name, complete: 0}
    Task.create!(attribute_hash)
   end
 end
end

TasksImporter.import