require_relative '../../config/application'

class List < ActiveRecord::Base
  has_many :tasks

  def self.get_list(id)
    List.tasks_on_this_list(id).map(&:description)
  end

  def self.add_task(list_id, task_description)
  	Task.create(description: task_description, done: "0", list_id: list_id)
  end

  def self.delete_task(list_id, task_position)
  	tasks = List.tasks_on_this_list(list_id)
  	tasks[task_position-1].destroy
  end

  def self.tasks_on_this_list(list_id) # returns an array of task objects belonging to a specified list
  	List.find(list_id).tasks.to_a
  end

  def self.complete_task(list_id, task_position)
  	tasks = List.tasks_on_this_list(list_id)
  	tasks[task_position-1][:complete] = "1"
  end

end


