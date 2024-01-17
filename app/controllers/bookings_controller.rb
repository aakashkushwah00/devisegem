class BookingsController < ApplicationController
  
  def index 
  end

  def show 

  end

  def new
    @booking = Booking.new
    @rooms = Room.all
  end

  def create
    @booking = Booking.new(booking_params)
    

    if @booking.save
      # BookingMailer.booking_success(@booking).deliver_now

      redirect_to main_roomdisplay_path, notice: 'Booking successful!'
  
    else
      @rooms = Room.all
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:room_id, :check_in_date, :check_out_date, :user_id)
  end

end
