require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

view = TerminalView.new

if ARGV.length == 3
	List.send ARGV[0].to_sym, ARGV[1], ARGV[2]
elsif ARGV.length == 2
	List.send ARGV[0].to_sym, ARGV[1]
elsif ARGV.length == 1
	List.send ARGV[0].to_sym
else 
	puts "Wrong number of arguments...try again"
end