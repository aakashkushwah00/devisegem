require "test_helper"

class BookingMailerTest < ActionMailer::TestCase
  test "booking_success" do
    mail = BookingMailer.booking_success
    assert_equal "Booking success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_cancel" do
    mail = BookingMailer.booking_cancel
    assert_equal "Booking cancel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
