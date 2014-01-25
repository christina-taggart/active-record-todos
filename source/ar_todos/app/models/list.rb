require_relative '../../config/application'

class List < ActiveRecord::Base
  has_many :tasks

  def self.get_list(id)
    List.find(id).tasks.to_a.map(&:description)
  end
end

# List.show_list(1)
# puts
# p List.show_list(2)

