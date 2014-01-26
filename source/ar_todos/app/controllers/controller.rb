require_relative '../../config/application'

class Controller

	def initialize
	end

	def add_task(list_id, task_description)
		List.add_task(list_id, task_description)
	end

	def delete_task(list_id, task_position)
		deleted_item = List.delete_task(list_id, task_position)
		TerminalView.delete_task(deleted_item)
	end

	def list(list_id)
		TerminalView.list(list_id)
	end

	def complete(list_id, task_position)
		List.complete_task(list_id, task_position)
	end

	def add_list(name)
		List.add_list(name)
	end

	def view_lists
		TerminalView.show_lists
	end

	def change_list_name(list_id, new_name)
		List.change_list_name(list_id, new_name)
	end

end