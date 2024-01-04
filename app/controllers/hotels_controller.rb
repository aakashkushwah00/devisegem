class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to hotels_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name, :email, :contact_number, :address, :description)
    end
end
