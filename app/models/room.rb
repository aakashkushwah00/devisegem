require 'csv'
class Room < ApplicationRecord
  belongs_to :hotel
  has_one_attached :room_photo
  has_many :bookings, dependent: :destroy 


  # enum status: { available: 0, booked: 1 }

  # def available?
  #   status == 'available'
  # end




  
  def available?(check_in_date, check_out_date)
    overlapping_bookings = bookings.where(
      "(check_in_date <= ? AND check_out_date >= ?) OR (check_in_date <= ? AND check_out_date >= ?)",
      check_in_date, check_in_date, check_out_date, check_out_date
    )

    overlapping_bookings.empty?
  end
  
end
 