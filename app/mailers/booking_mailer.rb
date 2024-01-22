class BookingMailer < ApplicationMailer

  
  def booking_success(user, booking)
    @user = user 
    @booking = booking
    
    to_address = @user.email
    mail(to: to_address , subject: 'Room Booking Confirmation')

  end

  def booking_cancel(user, booking)
    @user = user 
    @booking = booking
    
    to_address = @user.email
    mail(to: to_address , subject: 'Room Cancel Confirmation')

  end
end
