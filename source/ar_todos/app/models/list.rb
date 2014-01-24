require_relative '../../db/config'

class List < ActiveRecord::Base
  has_many :tasks
end