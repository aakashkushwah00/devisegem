class MainController < ApplicationController
  def home
    
    @rooms = Room.all

    @hotels = Hotel.all

  end

  def roomdisplay
    @rooms = Room.find(params[:id])
  end

  def hotelrooms 
    @hotel = Hotel.find(params[:hotel_id])
    puts @hotel
    @rooms = @hotel.rooms
    puts "========================="
    puts @room
  end

  def book 
  end


end
