require_relative 'config/application'
require_relative 'app/models/list'
require_relative 'app/models/task'

command = ARGV.shift
message = ARGV.join(" ")
message == "" ? List.send(command) : List.send(command, message)