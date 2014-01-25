class Console
  def initialize
  end

  def display_list(tasks)
    tasks.each_with_index do |task, idx|
      puts "#{idx+1}. #{task.description} #{display_completed_box(task.completed)}"
    end
  end

  def display_completed_box(bool)
    bool ? "[X]" : "[ ]"
  end
end