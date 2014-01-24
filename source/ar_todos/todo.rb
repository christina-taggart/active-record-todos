require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"

p Task.where(list_id: 12)
p List.find(12)