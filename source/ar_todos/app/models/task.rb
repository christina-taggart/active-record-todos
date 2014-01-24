require_relative '../../config/application'
class Task < ActiveRecord::Base
  belongs_to :list
  after_initialize :set_completed

  def set_completed
    self.completed = false
  end

  def complete
    self.completed = true
  end

  def completed?
    self.completed
  end

end

