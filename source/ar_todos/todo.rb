require_relative "app/controllers/controller.rb"

class Program

  # Create

  def self.add_list
    name = ARGV.join(" ")
    list = List.create!({ name: name })
    puts "List created with name: #{name}"
  end

  def self.add_task # add_task LIST_ID TASK_WORDS
    list_id = ARGV.shift
    text = ARGV.join(" ")
    Task.create!({ list_id: list_id, body: text })
    puts "Task created: #{text}"
  end

  # Read

  def self.list_tasks
    list_id = ARGV.shift
    list = List.find(list_id)
    tasks = list.tasks
    render_list(list, tasks)
  end

  def self.show_completed
    list_id = ARGV.shift
    list = List.find(list_id)
    tasks = list.completed_tasks
    render_list(list, tasks)
  end

  def self.show_outstanding
    list_id = ARGV.shift
    list = List.find(list_id)
    tasks = list.outstanding_tasks
    render_list(list, tasks)
  end

  # Update

  def self.complete_task # complete_task 1 1
    list_id = ARGV.shift
    task_id_in_list = ARGV.shift
    list = List.find(list_id)
    task = list.tasks[task_id_in_list - 1]
    task.update(complete: 1)
  end

  def self.add_tag

  end

  # Delete

  def self.delete_list

  end

  def self.delete_task

  end

  def self.render_list(list, tasks)
    puts "\n\n#{list.name}"
    puts "---------------"
    tasks.each_with_index do |task, i|
      puts "#{i + 1}. ".ljust(5) + "[#{ task.completed == 1 ? "X" : " " }]" " #{task.body} " + "[#{task.tags.map{ |t| t.body }.join(", ")}]"
    end
  end

end



initial_command = ARGV.shift.to_sym

Program.send(initial_command)
