require_relative '../app/models/list'

module ListImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/lists.csv")
    field_names = nil
    List.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          task = List.create!(attribute_hash)
        end
      end
    end
  end
end