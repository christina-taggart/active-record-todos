require 'faker'
require_relative '../app/models/list'
require_relative '../app/models/task'

class SeedTables
  I18n.enforce_available_locales = false
  # def self.import
  #   # List.create(name: Faker::Company.catch_phrase)
  #   # 10.times do
  #   #   Task.create(description: Faker::Company.bs, done: "0")
  # end

  def self.create_lists
    2.times do
      List.create(name: Faker::Company.catch_phrase)
    end
  end

  def self.create_tasks
    10.times do
      Task.create(description: Faker::Company.bs, done: "0", list_id: ([1,2].sample) )
    end
  end
end

SeedTables.create_lists
SeedTables.create_tasks
puts "Yes, you seeded!"