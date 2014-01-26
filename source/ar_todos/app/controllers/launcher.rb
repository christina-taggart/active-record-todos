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
    convert_argv_to_string
    execute_command
  end

  private
  def valid_command?
    ARGV[0] ||= "no_user_input"
    @user_command = ARGV[0].downcase
    @valid_commands.include?(ARGV[0])
  end

  def execute_command
    list if @user_command.eql?("list")
    add if @user_command.eql?("add")
    delete if @user_command.eql?("delete")
    complete if @user_command.eql?("complete")
  end

  def list
    @console.display_list(@tasks)
  end

  def add
    Task.create({description: @task_description})
    @console.display_add_task(@task_description)
  end

  def delete
    task_num = ARGV[1].to_i
    task_id = @tasks[task_num-1].id # id of element to delete
    @console.display_deleted_task(@tasks[task_num-1].description)
    Task.destroy(Task.find_by(id: task_id))
  end

  def complete
    task_num = ARGV[1].to_i
    task_id = @tasks[task_num-1].id # id of item to mark complete
    task = Task.find_by({id: task_id})
    task.update(completed: task.completed ? false : true)
    @console.display_complete_task(task.description, task.completed)
  end

  def convert_argv_to_string
    @task_description = ARGV[1..-1].join(' ')
  end
end