# require 'csv'

class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    has_many :employees, dependent: :destroy
    # has_many :bookings, dependent: :destroy

  
    has_one_attached :hotel_photo, dependent: :destroy 
    
    # def self.to_csv 
    #     # attributes = %w{name address contact_number email description}
    #     attributes = Hotel.column_names
        
    #     CSV.generate(headers: true) do |csv|
    #     csv << attributes 

    #         all.each do |employee|
    #             csv << attributes.map {|attr| employee.send(attr)}
    #         end
    #     end
    # end 
end