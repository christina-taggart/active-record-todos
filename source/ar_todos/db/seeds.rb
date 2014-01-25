module ListTaskGenerator
  require 'faker'
  require_relative "../app/models/list.rb"
  require_relative"../app/models/list.rb"
  I18n.enforce_available_locales = false
  def self.generate_db_records
    1.times { List.create({name: Faker::Address.country}) }
    4.times { Task.create({description: Faker::Address.city}) }
  end
end

ListTaskGenerator.generate_db_records