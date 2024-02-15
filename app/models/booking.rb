class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :payments
  has_one :wallet

  # validates :check_in_date, :check_out_date, presence: true
  # validate :check_out_after_check_in
  # validate :check_room_availability

  # validates_uniqueness_of :room_id, scope: :date

  # private

  # def check_out_after_check_in
  #   return if check_in_date.blank? || check_out_date.blank?

  #   errors.add(:check_out_date, 'must be after check-in date') if check_out_date <= check_in_date
  # end

  # def check_room_availability
  #   return if room.nil?

  #   overlapping_bookings = room.bookings.where(
  #     "(check_in_date <= ? AND check_out_date >= ?) OR (check_in_date <= ? AND check_out_date >= ?)",
  #     check_in_date, check_in_date, check_out_date, check_out_date)

  #   errors.add(:base, 'Room is not available for the selected dates') if overlapping_bookings.exists?
  # end
end
