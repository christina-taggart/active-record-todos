require_relative '../app/models/task'

module TaskImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/tasks.csv")
    field_names = nil
    Task.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          task = Task.create!(attribute_hash)
        end
      end
    end
  end
end