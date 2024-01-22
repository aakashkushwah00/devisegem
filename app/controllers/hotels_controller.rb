class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "AlleHotel", template: "hotels/index", formats: [:html], layouts: "pdf ",
        orientation:                    'Landscape',
        page_size: 'A4'

        # Excluding ".pdf" extension.
      end
    end
    
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
      
      # CrudNotificationMailer.create_notification(@hotel).deliver_now

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
      
      # CrudNotificationMailer.update_notification(@hotel).deliver_now

      redirect_to @hotel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])

    # CrudNotificationMailer.delete_notification(@hotel).deliver_now
    
    @hotel.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name, :email, :contact_number, :address, :description, :hotel_photo)
    end
end
