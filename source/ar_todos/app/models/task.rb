require_relative '../../db/config'

class Task < ActiveRecord::Base
  #validates :done is 0 or 1.
  belongs_to :list
end

