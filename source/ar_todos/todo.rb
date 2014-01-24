require_relative 'config/application'

#-----VIEWER-----

class ToDo
  def self.run(command, argument)
    ARGV.clear
    ToDoController.process_command(command, argument)
  end

  def self.print_list(list_name, tasks)
    puts "\n\n#{list_name}:\n"
    puts "-" * (list_name.length+1)
    tasks.each { |task| puts "[ ] #{tasks.index(task)+1}: #{task.description}" }
  end

  def self.print_added_task(task_description, list_name)
    puts "\nAdded task to #{list_name}:"
    puts "#{task_description}"
  end

  def self.prompt_which_list
    puts "\nWhich list would you like to add this task to?"
    self.print_list_options
    chosen_list = gets.chomp
    list_hash[chosen_list]
  end

  def self.print_list_options
    list_hash = ToDoController.list_options
    list_hash.keys.each { |list_name| puts "- #{list_name}" }
  end

  def self.print_altered_task(task_description, list_name, revised_tasks, action)
    puts "\nTask #{action}:\n#{task_description}"
    self.print_list(list_name, revised_tasks)
  end
end

#-----CONTROLLER-----

class ToDoController
  def self.process_command(command, argument)
    if self.valid_command?(command)
      self.send(command, argument)
    else
      raise "Invalid command."
    end
  end

  def self.list(list_name)
    if list_name.downcase == 'all'
      puts "\nChoose from the following lists:\n"
      ToDo.print_list_options
    else
      tasks = self.get_ordered_tasks(list_name)
      if tasks.empty?
        raise "That list does not exist."
      else
        ToDo.print_list(list_name, tasks)
      end
    end
  end

  def self.add(task_description)
    chosen_list_id = ToDo.prompt_which_list
    task = Task.create!(description: task_description, list_id: chosen_list_id)
    ToDo.print_added_task(task.description, List.find(chosen_list_id).name)
  end

  def self.list_options
    Hash[List.all.map { |list| [list.name, list.id] }]
  end

  def self.delete(argument_string)
    task = self.get_task_from_list(argument_string)
    task.destroy
    self.alter_list(task, "deleted")
  end

  def self.complete(argument_string)
    task = self.get_task_from_list(argument_string)
    task.complete!
    self.alter_list(task, "completed")
  end

  private

  def self.alter_list(task, action)
    list_name = List.find(task.list_id).name
    revised_tasks = self.get_ordered_tasks(list_name)
    ToDo.print_altered_task(task.description, list_name, revised_tasks, action)
  end

  def self.get_task_from_list(argument_string)
    list_name = self.extract_list_name(argument_string)
    task_num = self.extract_task_num(argument_string)
    tasks = self.get_ordered_tasks(list_name)
    Task.find(tasks[task_num-1].id)
  end

  def self.extract_list_name(argument_string)
    argument_string[/\A.+[^\d+\z]/].strip
  end

  def self.extract_task_num(argument_string)
    argument_string[/\d+\z/].to_i
  end

  def self.valid_command?(command)
    command == "list" || command == "add" || command == "delete"
  end

  def self.get_ordered_tasks(list_name)
    Task.where(list_id: List.find_by(name: list_name)).map { |task| task }
  end
end


#-----ARGV-----
command = ARGV.shift
argument = ARGV.join(" ") unless ARGV.empty?
ToDo.run(command, argument)
