class DocumentsController < ApplicationController
    def show
      @employee = Employee.find(params[:employee_id])
      @document = @employee.documents.find(params[:id])
    end
  
    def create
        @employee = Employee.find(params[:employee_id])
        params[:files].each_with_index do |file, index|
          description = params[:descriptions][index]
          @document = @employee.documents.create(description: description)
          @document.files.attach(file)
        end
        redirect_to employee_path(@employee), notice: "ファイルをアップロードしました"
    end

    def destroy
        @document = Document.find(params[:id])
        @employee = @document.employee
        @document.destroy
        redirect_to employee_path(@employee), notice: "ファイルを削除しました"
    end
      
        
      
  
    private
  
    def document_params
        params.require(:document).permit(:description, files: [])
    end
      
  end