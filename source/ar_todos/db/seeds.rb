require 'faker'
require_relative '../app/models/list'
require_relative '../app/models/task'

module Importer

  extend self

  def create_list_name(number)
    number.times do
      name = Faker::Company.name
      List.create(name: name)
    end
  end

  def create_task(number)
    number.times do
      task_text = Faker::Company.bs
      Task.create(task_text: task_text)
    end
  end

end

create_list_name(30)
create_task(100)