require_relative "../../config/application.rb"
class List < ActiveRecord::Base
  has_many :tasks
  def self.list(id=1)
    Task.where("list_id = ?", id).to_a
  end
end