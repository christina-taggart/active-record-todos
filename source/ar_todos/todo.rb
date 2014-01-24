require_relative 'config/application'
require_relative 'app/models/list'
require_relative 'app/models/task'


input = ARGV[0]
item = ARGV[1..-1].join(" ")




if ['list', 'add', 'complete', 'delete'].include?(input)
  List.send(input, item)
else
  puts "whargarbl"
end



