require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"

=begin
Pseudocode:
ADD items
DELETE items
UPDATE with completness
LIST ALL

MODELS
______________
tasks
----
id
name
complete?
_______________
=end

class List
  def initialize
    @command = ARGV[0]
    @argument = ARGV[1..-1]
    get_started
  end

  def get_started
    case @command
    when "add"
      add(@argument.join(" "))
    when "delete"
      delete(@argument.join.to_i)
    when "complete"
      complete(@argument.join.to_i)
    when "list"
      list_all
    else
      puts "INVALID COMMAND"
      puts "type add, delete, complete, list"

    end
  end

  def add(task_name)
    task = Task.create!(name: task_name, complete: 0)
  end

  def delete(id)
    task = Task.find(id)
    task.destroy
  end

  def list_all
    Task.all.each do |task|
      if task.complete == 0
        puts "[ ]#{task.name} (ID:#{task.id})"
      else
        puts "[X]#{task.name} (ID:#{task.id})"
      end
    end
  end

  def complete(id)
    task = Task.find(id)
    task.complete = 1
    task.save
  end

end

list = List.new
list