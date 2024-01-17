class BookingMailer < ApplicationMailer

  
  def booking_success(user)
    @user = user 
    mail(to: @user.email , subject: 'Welcome to Our Hotel Management System')

  end

  def booking_cancel
    
  end
end
