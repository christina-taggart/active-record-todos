require_relative '../../config/application'
# require_relative '..spec/todo'

class List < ActiveRecord::Base
  has_many :tasks


  def self.list(item)
    Task.all.each {|x| puts x.task}
  end

  def self.add(item)
    puts "add this "
    Task.create({task: item, created_at: Time.now, status: 0})
  end

  def self.delete(item)
    puts "bye bye"
    Task.find(item).destroy

  end

  def self.complete(item)
    puts "all done and stuff"
    Task.find(item).update_attribute('status','1')
  end

end
