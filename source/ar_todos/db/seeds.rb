require 'faker'
require_relative '../config/application'
require_relative '../app/models/list'
require_relative '../app/models/task'

module Import_Data
  def self.create_task_data
    15.times { Task.create( {
      description: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6),
      completed: Random.rand(2)}
      ).save
    }
  end

  def self.create_list_data
    List.create( {
      name: Faker::Company.name
    } )
  end

end