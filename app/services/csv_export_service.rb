require 'csv'

class CsvExportService 
  def initialize(data)
    @data = data
  end

#   def generate_csv 
#     CSV.generate(headers: true) do |csv|
#       csv << csv_headers
 #       @objects.each do |object|
#           csv << csv_row(object)
#       end
#     end
#   end

  def to_csv 
    # attributes = %w{name address contact_number email description}
    attributes = Hotel.column_names
    
    CSV.generate(headers: true) do |csv|
    csv << attributes 

        @data.all.each do |employee|
            csv << attributes.map {|attr| employee.send(attr)}
        end
    end
end 
    
#   private 

#   def csv_headers
#     @objects.first.attributes.keys
#   end

#   def csv_row(object)
#     object.attributes.values 
#   end
end