require_relative '../../config/application.rb'

class Cat < ActiveRecord::Base
  belongs_to :tag
  belongs_to :task
end