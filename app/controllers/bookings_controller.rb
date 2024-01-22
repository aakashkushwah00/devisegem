class BookingsController < ApplicationController

  before_action :authenticate_user!
  
  def show 
    @booking = Booking.find(params[:id])
   
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Booking id: #{@booking.id}", template: "bookings/bookingpdf", formats: [:html]  # Excluding ".pdf" extension.
      end
    end
    
  end

  def new
    @booking = Booking.new
    @room = Room.find(params[:id])

  end

  def create
    
    @booking = current_user.bookings.build(booking_params)
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:booking][:room_id])

    puts "======================="
    puts @room

    if room_available?(@booking.room, @booking.check_in_date, @booking.check_out_date) && @booking.save

      BookingMailer.booking_success(current_user, @booking).deliver_now

      flash[:notice] = 'Room booked successfully!'
      redirect_to main_index_path
    else
      flash[:alert] = 'Room not available for the selected dates.'
      render :new, status: 422
    end

    
  end

  def index 
    @bookings = current_user.bookings
  end
  
  def destroy 
    @booking = Booking.find(params[:id])
    @booking.destroy 
    
    BookingMailer.booking_cancel(current_user, @booking).deliver_now

    redirect_to root_path, notice: 'booking cancel successfully!'
  end

  private

  def booking_params
    params.require(:booking).permit(:room_id, :check_in_date, :check_out_date, :user_id, :name, :email, :contact_number)
  end

  def room_available?(room, check_in_date, check_out_date)
    !Booking.exists?(room: room, check_out_date: (check_in_date..check_out_date)) && !Booking.exists?(room: room, check_in_date: (check_in_date..check_out_date))
  end

end
