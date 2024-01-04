class EmployeesController < ApplicationController
  def allemployee 
    @employees = Employee.all
  end 

  def index
    @hotel = Hotel.find params[:hotel_id]
    @employees = @hotel.employees
    # @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def create 
  end 

  def edit
  end

  def update 
  end

  def destroy 
  end

end
