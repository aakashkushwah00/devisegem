class RoomsController < ApplicationController
  def allrooms 
    @rooms = Room.all
  end 
  
  def index
    # @rooms = Room.all
    @hotel = Hotel.find params[:hotel_id]
    @rooms = @hotel.rooms
  end

  def show
    # puts "===================================="
    # puts params
    # puts "===================================="
    @room = Room.find(params[:id])

  end

  def new
    # @hotel = Hotel.find(params[:hotel_id])
    # @room = Room.new
    # @room = @hotel.Rooms.new
  end

  def create 
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.create(room_params)
    redirect_to hotel_path(@hotel)
  end
  

  def edit
  end

 

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy 

    redirect_to root_path
  end

  private 
  def room_params 
    params.require(:room).permit(:price,:room_type,:occupancy)
  end
end
