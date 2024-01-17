class DashboardController < ApplicationController
    # before_action :logged_in_user
#   include ApplicationHelper 

	def index
	  redirect_to new_dashboard_path,flash: { alert: "Cities Can't be same" } and return if params[:from_id]==params[:to_id]
	  if params[:date] < (Date.today).to_s
	  	flash[:alert] = "Past Dates Not allowed."
			redirect_to new_dashboard_path
	  else
	  	# bus_route = Hotel(bus_params)
		#   @buses = Room.where(bus_route: bus_route).where("departure_time::date = ?", params[:date])
        @hotel = Hotel.order(:name).pluck(:name, :id)

		@hotels = @hotel.find.params(:hotel_id)
	  end	
	end

	def new
        @hotel = Hotel.order(:name).pluck(:name, :id)

		@room =  Room.order(:id).pluck(:room_type, :id)
	end

	private

	def bus_params
		params.permit(:from_id, :to_id)
	end
end
