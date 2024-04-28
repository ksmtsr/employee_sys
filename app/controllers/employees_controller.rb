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
      redirect_to root_path, notice: "従業員の登録が完了しました"
    else 
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @documents = @employee.documents
    @new_document = Document.new
  end
  
  def batch_delete
    if params[:employee_ids].nil? || params[:employee_ids].empty?
      flash[:alert] = "チェックボックスを選択してください。"
      redirect_to employees_path
    else
    Employee.where(id: params[:employee_ids]).destroy_all
    redirect_to employees_path, notice: '選択した従業員が削除されました。'
  end
end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: "従業員の情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  redirect_to employees_path, notice: "従業員の削除が完了しました"
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
