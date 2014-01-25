require_relative '../../config/application'

class List < ActiveRecord::Base
  has_many :tasks

  def self.get_list(id) # retrieves an array of task descriptions for a given list
    List.tasks_on_this_list(id).map(&:description)
  end

  def self.add_task(list_id, task_description) # adds a task to a specified list
  	Task.create(description: task_description, done: "0", list_id: list_id)
  end

  def self.delete_task(list_id, task_position) # deletes a task from a specified list
  	tasks = List.tasks_on_this_list(list_id)
  	tasks[task_position-1].destroy
  end

  def self.tasks_on_this_list(list_id) # returns an array of task objects belonging to a specified list
  	List.find(list_id).tasks.to_a
  end

  def self.complete_task(list_id, task_position) # marks a specified task on a specified list as complete (i.e. "1")
  	tasks = List.tasks_on_this_list(list_id)
  	tasks[task_position-1].update_attribute(:done, "1")
  end

end


