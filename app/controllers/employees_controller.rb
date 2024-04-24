class EmployeesController < ApplicationController

  require 'happybirthday'

  def index
    @employees = Employee.all
    @employees.each do |employee|
      birthday = Happybirthday.born_on(employee.birthday)
      employee.age = birthday.age.years_old
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    employee.save
    redirect_to :root_path
  end

  def destroy

  end

  def destroy_all

  end

  
  
  private

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :postal_code, :address, :telephone_number, :start_date, :end_date)
  end

end
