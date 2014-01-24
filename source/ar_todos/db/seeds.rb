module ListTaskGenerator
  require 'faker'
  require_relative "../app/models/list.rb"
  require_relative"../app/models/list.rb"
  I18n.enforce_available_locales = false
  def self.generate_db_records
    3.times {p List.create({name: Faker::Address.country})}
    12.times {Task.create({description: Faker::Address.city, completed: false, list_id: (rand(3)+1)})}
  end
end

ListTaskGenerator.generate_db_records