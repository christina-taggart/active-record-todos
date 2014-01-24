require_relative '../../config/application'

class List < ActiveRecord::Base
  has_many :tasks

  def self.list
    counter = 0
    self.all.first.tasks.each do |task|
      out = "#{counter += 1}. #{task.description}"
      out += " Completed!" if task.completed == 1
      puts out
    end
  end

  def self.delete(id)
    tasks = self.all.first.tasks
    to_delete = tasks[id.to_i - 1]
    puts "The task #{to_delete.description} has been deleted."
    to_delete.destroy
  end

  def self.complete(id)
    tasks = self.all.first.tasks
    task = tasks[id.to_i - 1]
    task.update(completed: 1)
    puts "The task #{task.description} has been completed."
  end

  def self.add(description)
    tasks = self.all.first.tasks
    task = Task.create!(description: description, completed: 0, list_id: self.first.id)
    puts "You have created the task #{task.description}"
  end

end