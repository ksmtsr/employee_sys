require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it '一覧ページを表示する' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    render_views

    it '新規作成ページがフォームパーシャルを含んでいること' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('employees/_form')
    end
  end

  describe 'POST #create' do
    context '有効なパラメータを送信した場合' do
      it '従業員を新規作成する' do
        expect do
          post :create, params: { employee: FactoryBot.attributes_for(:valid_employee) }
        end.to change(Employee, :count).by(1)
      end

      it 'ルートパスにリダイレクトする' do
        post :create, params: { employee: FactoryBot.attributes_for(:valid_employee) }
        expect(response).to redirect_to(root_path)
      end
    end

    context '無効なパラメータを送信した場合' do
      it '従業員を新規作成しない' do
        expect do
          post :create, params: { employee: FactoryBot.attributes_for(:employee, first_name: nil) }
        end.not_to change(Employee, :count)
      end

      it '新規作成ページを再表示する' do
        post :create, params: { employee: FactoryBot.attributes_for(:employee, first_name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:employee) { create(:valid_employee) }

    it 'リクエストされた従業員を @employee に割り当てること' do
      get :show, params: { id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end
    
    it '新しいドキュメントを @new_document に割り当てること' do
      get :show, params: { id: employee.id }
      expect(assigns(:new_document)).to be_a_new(Document)
    end
    
    it 'show テンプレートをレンダリングすること' do
      get :show, params: { id: employee.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #batch_delete' do
    it '選択した従業員が削除されること' do
      employee1 = create(:valid_employee)
      employee2 = create(:valid_employee)
      post :batch_delete, params: { employee_ids: [employee1.id, employee2.id] }
      expect(Employee.count).to eq(0)
    end

    it 'チェックボックスが選択されていない場合は従業員が削除されないこと' do
      employee = create(:valid_employee)
      post :batch_delete, params: { employee_ids: [] }
      expect(Employee.count).to eq(1)
    end
  end

  describe 'GET #edit' do
    it '指定した従業員の編集ページを表示すること' do
      employee = FactoryBot.create(:valid_employee)
      get :edit, params: { id: employee.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let(:employee) { create(:valid_employee) }

    context '更新が失敗した場合' do
      let(:invalid_params) { { employee: attributes_for(:invalid_employee) } }

      it '編集ページを表示すること' do
        patch :update, params: { id: employee.id }.merge(invalid_params)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it '指定した従業員が削除されること' do
      employee = create(:valid_employee)
      delete :destroy, params: { id: employee.id }
      expect(Employee.count).to eq(0)
    end
  end
end
