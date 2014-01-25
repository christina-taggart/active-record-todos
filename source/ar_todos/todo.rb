require_relative 'config/application' #this is already giving access to task and list classes...

#puts "Put your application code in #{File.expand_path(__FILE__)}"


def list
  list = List.find(1)
  tasks = list.tasks.to_a
  tasks.each_with_index {|task, idx| puts "#{idx + 1}. #{task.description} #{complete(task.completed)}" }
end

def add(task)
  new_task = task.join(' ')
  Task.create(list_id: 1, description: new_task, completed: 0)
  puts "Appended '#{new_task}' to your TODO list..."
end

def delete(task_number)
  puts "this is my task number"
  task_number = task_number[0].to_i-1
  task_array = Task.where("list_id = ?", 1).to_a
  id_to_delete =  task_array[task_number].id
  Task.delete(id_to_delete)
end

def complete(task_number)
  task_number = task_number[0].to_i-1
  task_array = Task.where("list_id = ?", 1).to_a
  id_to_mark_complete =  task_array[task_number].id
  if task_array[task_number].completed == 0
    task = Task.find_by(:id => id_to_mark_complete)
    task.update(completed: 1)
    return "[X]"
  else
    task = Task.find_by(:id => id_to_mark_complete)
    task.update(completed: 0)
    return "[ ]"
  end
end


command = ARGV[0]
args = ARGV[1..-1]
if command == 'list'
  list
elsif command == 'add'
  add(args)
elsif command == 'delete'
  delete(args)
elsif command.eql?('complete')
  complete(args)
end