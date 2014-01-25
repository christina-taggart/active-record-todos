require_relative '../../config/application.rb'

class Task < ActiveRecord::Base
  belongs_to :list
  has_many :cats
  has_many :tags, through: :cats

end