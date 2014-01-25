require_relative 'config/application'
require_relative 'app/models/task'
require_relative 'app/models/list'

class View

  def self.print_list
    Task.all.each do |task|
      task.done == false ? box = "[ ]" : box = "[X]"
      puts "#{box} #{task.task_text.capitalize}"
    end
  end

  def self.completed_task
    puts "The task has been completed!"
  end

  def self.added_task
    puts "Added: '#{Task.last.task_text}!'"
  end

  def self.deleted_task
    puts "Deleted: '#{ARGV[1]}!'"
  end

  def self.invalid_entry
    puts "Seriously!?! There's only four commands..."
  end

end


class Controller

  def initialize
    View.new
    run!
  end

  def run!
    case ARGV[0]
    when "list"
      View.print_list
    when "add"
      #will have to add list_id for more lists
      Task.create!(task_text: ARGV[1], list_id: 1)
      View.added_task
    when "delete"
      Task.destroy(ARGV[1])
      View.deleted_task
    when "complete"
      Task.find(ARGV[1]).update(done: true)
      View.completed_task
    else
      View.invalid_entry
    end
  end
end

Controller.new






