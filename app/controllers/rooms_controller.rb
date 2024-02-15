class RoomsController < ApplicationController
  # def allrooms 
  #   @rooms = Room.all
  # end 
  
  def index
    # @rooms = Room.all

    @hotel = Hotel.find params[:hotel_id]
    @rooms = @hotel.rooms


    #   respond_to do |format|
    #   format.html
    #   format.csv  do 
    #     csv_data = CsvExportService.new(@rooms).generate_csv
    #     send_data csv_data, filename: "rooms- #{Date.today}.csv"
    #   end
    #  end

  end

 

  def show
    # puts "===================================="
    # puts params
    # puts "===================================="
    @room = Room.find(params[:id])

  end

  def new
    @room = Room.new
    @hotel = Hotel.find(params[:hotel_id])
  end

  def create 
    @hotel = Hotel.find(params[:hotel_id])

    @room = @hotel.rooms.create(room_params)
    redirect_to hotel_path(@hotel)
  end
  

  def edit 
      @hotel = Hotel.find(params[:id])
      @room = @hotel.rooms.find(params[:id])
  end

  def update
    if @room.update(room_params)
      redirect_to @hotel, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end
 

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy 

    redirect_to root_path
  end






  # def search
  #   @hotel = Hotel.find(params[:hotel_id])
  #   # @check_in_date = params[:check_in_date]
  #   # @check_out_date = params[:check_out_date]
  #   # @guests = params[:guests]

  #   # @available_rooms = Room.available_rooms(@check_in_date, @check_out_date, @guests, @hotel)
  #   @available_rooms = Room.available_rooms(@hotel)

  # end

  # def available_rooms
  #   @check_in_date = params[:check_in_date]
  #   @check_out_date = params[:check_out_date]
  #   # @guests = params[:guests]
  #   @available_rooms = Room.available_rooms(@check_in_date, @check_out_date)
  # end


  private 
  def room_params 
    params.require(:room).permit(:price,:room_type,:occupancy, :room_photo, :capacity, :floor_number)
  end
end
