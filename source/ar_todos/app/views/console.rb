class Console

  def initialize
  end

  def display_list(tasks)
     tasks.each_with_index {|task, idx| puts "#{idx + 1}. #{task.description} #{complete(task.completed)}" }
  end

  def display_add(new_task)
    puts "Appended '#{new_task}' to your TODO list..."
  end

  def display_complete(completed)
    completed ? "[X]" : "[ ]"
  end

  def display_delete
    "Item deleted from your list."
  end


end