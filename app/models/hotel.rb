class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    has_many :employees, dependent: :destroy
  
    has_one_attached :hotel_photo
    
end
