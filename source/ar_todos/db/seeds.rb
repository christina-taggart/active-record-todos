require 'faker'
require_relative '../app/models/list'
require_relative '../app/models/task'

module Importer

  extend self

  def create_list_name
    30.times do
      name = Faker::Company.name
      List.create(name: name)
    end
  end

  def create_task
    100.times do
      task_text = Faker::Company.bs
      Task.create(task_text: task_text, done: 0, list_id: rand(1..30))
    end
  end

end


