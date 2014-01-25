require_relative '../models/tag.rb'
require_relative '../models/task.rb'
require_relative '../models/list.rb'

class Controller

  # Create

  def self.add_list(name)
    list = List.create({ name: name })
  end

  def self.add_task(list_id, text)
    Task.create!({ list_id: list_id, body: text })
  end


  # Read

  def self.get_list_tasks(list_id)
    List.where(id: list_id)[0].tasks
  end

  def self.get_all_completed(list_id)
    list = List.find list_id
    list.completed_tasks
  end

  def self.get_all_outstanding(list_id)
    List.where(id: list_id)[0].tasks.select{ |task| task.completed != 1}
  end

  # Update

  def self.complete_task(task_id)
    Task.where(id: task_id)
  end


  def self.add_task(list_id, text)
    Task.create!(list_id: list_id, body: text)
  end

  def self.add_list(name)
    List.create!({name: name})
  end

  # Delete


  def self.delete_list

  end

  def self.delete_task

  end

end
