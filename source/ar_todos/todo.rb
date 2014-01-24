require_relative 'config/application'

#-----VIEWER-----

class ToDo
  def self.run(command, *argument)
    ToDoController.process_command(command, argument)
    puts "ok"
  end
end


#-----CONTROLLER-----

class ToDoController
  def self.process_command(command, *argument)
    self.send(command, *argument)
  end

  def self.list
    puts "Hello, world!"
  end
end


#-----ARGV-----
puts "before"
command = ARGV.shift
argument = ARGV.join(" ") unless ARGV.empty?
ToDo.run(command, argument)
