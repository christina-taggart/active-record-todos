require_relative "../../config/application.rb"
require_relative "../../app/Views/console.rb"


class Run

	def initialize
		@console = Console.new
	end


	def list
	  list = List.find(1)
	  tasks = list.tasks.to_a
	  #console.display_list(tasks)
	  tasks.each_with_index {|task, idx| puts "#{idx + 1}. #{task.description} #{complete(task.completed)}" }
	end

	def add(task)
	  new_task = task.join(' ')
	  Task.create(list_id: 1, description: new_task, completed: 0)
	  @console.display_add(new_task)
	end

	def delete(task_number)
	  task_number = task_number[0].to_i-1
	  task_array = Task.where("list_id = ?", 1).to_a
	  id_to_delete =  task_array[task_number].id
	  Task.delete(id_to_delete)
	  @console.display_delete
	end

	def complete(task_number)
	  task_number = task_number[0].to_i-1
	  task_array = Task.where("list_id = ?", 1).to_a
	  id_to_mark_complete =  task_array[task_number].id
	  if task_array[task_number].completed == 0
	    task = Task.find_by(:id => id_to_mark_complete)
	    task.update(completed: 1)
	    @console.display_complete(true)
	  else
	    task = Task.find_by(:id => id_to_mark_complete)
	    task.update(completed: 0)
	    @console.display_complete(false)
	  end
	end

	def valid_arg?
		commands = %w{list add delete complete}
		commands.include?(ARGV[0].downcase)
	end

	def run_program
		raise ArgumentError.new("Invalid command. Please enter 'list' 'add' 'delete' or 'complete.'") unless valid_arg?
		command = ARGV[0]
		args = ARGV[1..-1]
		list if command == 'list'
		add(args) if command == 'add'
		delete(args) if command == 'delete'  
		complete(args) if command.eql?('complete')
	end

end