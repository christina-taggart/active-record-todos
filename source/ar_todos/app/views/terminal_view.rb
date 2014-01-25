require_relative '../../config/application'

class TerminalView # right now this is kinda controller and view

	def initialize
	end

	### stuff for tasks

	def self.list(id)
		List.get_tasks_for_list(id).each_with_index do |task, index| 
      puts "#{index+1}. #{task.capitalize}"
    end
	end

	def self.delete_task(deleted_item) # deletes a given task from the list and displays desired message to user
    puts "You just deleted '#{deleted_item[:description]}'' from your list."
  end

  ### stuff for lists

	def self.show_lists
    puts "Here are all of your lists:"
    List.retrieve_list_names.each_with_index do |name, index| 
      puts "#{index+1}. #{name.capitalize}"
    end
  end

end
