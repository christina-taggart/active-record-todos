require_relative '../../config/application.rb'

class Tag < ActiveRecord::Base
  # has_and_belongs_to_many :tasks
  has_many :cats
  has_many :tasks, through: :cats

end