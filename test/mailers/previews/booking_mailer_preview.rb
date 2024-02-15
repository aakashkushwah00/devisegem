# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_success
  def booking_success
    BookingMailer.booking_success
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_cancel
  def booking_cancel
    BookingMailer.booking_cancel
  end

end
