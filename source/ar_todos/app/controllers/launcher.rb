require_relative "../../config/application.rb"
require_relative "../../app/views/console.rb"
class Launcher

  def initialize
    @valid_commands = ['list', 'add', 'delete', 'complete']
    @console = Console.new
    @tasks = List.list
  end

  def run
    raise ArgumentError.new("Only list, add, delete, complete are valid commands!") unless valid_command?
    execute_command
  end

  private
  def valid_command?
    ARGV[0] ||= "no_user_input"
    @user_command = ARGV[0].downcase
    convert_argv_to_string
    @valid_commands.include?(ARGV[0])
  end

  def execute_command
    if @user_command.eql?("list")
      @console.display_list(@tasks)
    elsif @user_command.eql?("add")
      Task.create({description: @task_description})
      @tasks = List.list
      puts "Appended \"#{@task_description}\" to your TODO list..."
    elsif @user_command.eql?("delete")
      task_num = ARGV[1].to_i
      task_id = @tasks[task_num-1].id # id of element to delete
      puts "Deleted \"#{@tasks[task_num-1].description}\" from your TODO list..."
      Task.destroy(Task.find_by(id: task_id))
      @tasks = List.list
    elsif @user_command.eql?("complete")
      puts "you tried to complete a task"
      task_num = ARGV[1].to_i
      task_id = @tasks[task_num-1].id # id of item to mark complete
      puts "something something something"
      task = Task.find_by({id: task_id})
      task.update(completed: task.completed ? false : true)
    else
      puts "I do not understand #{@user_command}."
    end
  end

  def convert_argv_to_string
    @task_description = ARGV[1..-1].join(' ')
  end
end