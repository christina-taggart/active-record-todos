require 'faker'
require 'csv'


25.times do
  File.open('../db/data/tasks.csv', 'a') do |csv|
      csv.puts "#{Faker::Lorem.sentence},0,#{rand(5) + 1}"
  end
end
