class Console
  def initialize
  end

  def display_list(tasks)
    tasks.each_with_index do |task, idx|
      puts "#{idx+1}. #{task.description} #{display_completed_box(task.completed)}"
    end
  end

  def display_add_task(task_description)
    puts "Appended \"#{task_description}\" to your TODO list..."
  end

  def display_deleted_task(task_description)
    puts "Deleted \"#{task_description}\" from your TODO list..."
  end

  def display_completed_box(bool)
    bool ? "[X]" : "[ ]"
  end

  def display_complete_task(task_description, completed)
    if completed
      puts "#{task_description} has been marked as complete."
    else
      puts "#{task_description} has been marked as incomplete."
    end
  end
end