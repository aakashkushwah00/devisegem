class EmployeesController < ApplicationController
  def allemployee 
    @employees = Employee.all
  end 

  def index
    # @hotel = Hotel.find params[:hotel_id]
    # @employees = @hotel.employees
    @employees = Employee.all
  end

  def show
  end

  def new
  end

  def edit
  end

end
