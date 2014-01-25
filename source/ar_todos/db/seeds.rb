require 'faker'
require_relative '../app/models/list'
require_relative '../app/models/task'

module Importer

  extend self

  def create_list_name
    name = Faker::Company.name
    List.create(name: name)
  end

  def create_task
    10.times do
      task_text = Faker::Company.bs
      Task.create(task_text: task_text, list_id: 1)
    end
  end

end


