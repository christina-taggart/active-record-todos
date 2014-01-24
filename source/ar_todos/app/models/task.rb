require_relative '../../config/application'


class Task < ActiveRecord::Base
  validates :name, presence: true
end