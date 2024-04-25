class EmployeesController < ApplicationController

  require 'happybirthday'

  def index
    @employee = Employee.new
    @employees = Employee.all
    logger.debug(@employees.inspect)
  end
  

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save 
      redirect_to root_path
    else 
      render :new
    end
  end


  def show
    @employee = Employee.find(params[:id])
    @documents = @employee.documents
    @new_document = Document.new
  end
  

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path, notice: "削除しました"
  end


  def destroy_all
    Employee.destroy_all
    redirect_to root_path, notice: "削除しました"
  end

  
  
  private

  def calculate_age(birthday)
    birthday = Happybirthday.born_on(birthday)
    birthday.age.years_old
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :postal_code, :address, :telephone_number, :start_date, :end_date)
  end
  

end
