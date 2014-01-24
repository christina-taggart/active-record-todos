class Task < ActiveRecord::Base
  belongs_to :list

  def complete
    self.is_completed = 1
    self.save
  end
end