require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"

class CommandlineTodo
  def self.list_tasks(*arg)
    list = List.find(1).tasks.sort_by(&:created_at)
    list.each_with_index do |item, index|
      puts "#{(index + 1).to_s.rjust(2)}. [#{display_completed(item)}] #{item.description}"
    end
  end

  def self.display_completed(item)
    return "X" if item.is_completed == 1
    return " " if item.is_completed == 0
    return " " if item.is_completed == nil
  end

  def self.add_tasks(task)
    task = task.join(' ')
    list = List.find(1)
    list.tasks << Task.create(description: task, is_completed: 0)
    puts "Added #{task} to your list."
  end

  def self.delete_tasks(task_id)
    list = List.find(1).tasks.sort_by(&:created_at)
    Task.delete(list[(task_id[0].to_i-1)].id)
    list_tasks
  end

  def self.complete_tasks(task_id)
    list = List.find(1).tasks.sort_by(&:created_at)
    (list[task_id[0].to_i].complete)
  end

end

command_keywords = {"list" => :list_tasks, "add" => :add_tasks, "delete" => :delete_tasks, "complete" => :complete_tasks}
CommandlineTodo.send(command_keywords[ARGV[0]], ARGV[1..-1])