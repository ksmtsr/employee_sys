class EmployeesController < ApplicationController

  def index
  end

  def def new
    @employee = Employee.new
  end
  

  private

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :postal_code, :address, :telephone_number, :start_date, :end_date)
  end

end
