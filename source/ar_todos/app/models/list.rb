require_relative '../../config/application.rb'

class List < ActiveRecord::Base
  has_many :tasks

  def completed_tasks
    self.tasks.where(completed: 1)
  end

  def outstanding_tasks
    self.tasks.where(completed: 0)
  end
end

