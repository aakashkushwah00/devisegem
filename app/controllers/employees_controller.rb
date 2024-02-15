class EmployeesController < ApplicationController
  
  # def allemployee 
  #   @employees = Employee.all
  # end 

  # def index
  #   @hotel = Hotel.find params[:hotel_id]
  #   @employees = @hotel.employees
  #   # @employees = Employee.all
  # end

  # def show
  #   @employee = Employee.find(params[:id])
  # end

  # def new
  #   # @employee = @hotel.employees.new
  #   @employee = Employee.new
  #   @hotel = Hotel.find(params[:hotel_id])
  # end


  # def create 
  #   @hotel = Hotel.find(params[:id])
  #   @employee = @hotel.employee.create(employee_params)
  #   if @employee.save 
  #        redirect_to @employee
  #   else
  #     render :new
  #   end
  # end 
  
  

  # def edit
    
  # end

  # def update 

  # end

  # def destroy 

  # end

  # private
  # def employee_params
  #   params.require(:employee).permit(:first_name, :last_name, :position, :salary)
  # end

  before_action :set_hotel

    def index
      @employees = @hotel.employees
    end

    def show
      @employee = Employee.find(params[:id])
    end

    def new

      @employee = @hotel.employees.build
    end

    def create
      @employee = @hotel.employees.build(employee_params)
      if @employee.save
        redirect_to admin_hotel_employees_path(@hotel), notice: 'Employee added successfully.'
      else
        render :new
      end
    end


    # def new
    #   @employee = Employee.new
    #   @hotel = Hotel.find(params[:hotel_id])
    # end
  
    # def create 
    #   @hotel = Hotel.find(params[:hotel_id])
    #   @employee = @hotel.employees.create(room_params)
    #   redirect_to hotel_path(@hotel)
    # end





    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy 

      redirect_to root_path
    end

   

    # Implement edit, update, and destroy actions
    # ...

    private

    # filter 
    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :salary, :position)
    end
    
end
