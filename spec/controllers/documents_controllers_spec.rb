require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:employee) { create(:valid_employee) }

  describe 'GET #show' do
    let(:document) { create(:document, employee: employee) }

    it 'リクエストされた従業員のドキュメントを表示すること' do
      get :show, params: { employee_id: employee.id, id: document.id }
      expect(assigns(:employee)).to eq(employee)
      expect(assigns(:document)).to eq(document)
    end

    it 'show テンプレートをレンダリングすること' do
      get :show, params: { employee_id: employee.id, id: document.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #create' do
    let(:files) { [fixture_file_upload('test_file.txt', 'text/plain')] }

    it 'ファイルをアップロードすること' do
      expect {
        post :create, params: { employee_id: employee.id, files: files, descriptions: ['description'] }
      }.to change(Document, :count).by(1)
    end

    it '従業員のページにリダイレクトすること' do
      post :create, params: { employee_id: employee.id, files: files, descriptions: ['description'] }
      expect(response).to redirect_to(employee_path(employee))
    end
  end

  describe 'DELETE #destroy' do
    let!(:document) { create(:document, employee: employee) }

    it 'ドキュメントを削除すること' do
      expect {
        delete :destroy, params: { id: document.id }
      }.to change(Document, :count).by(-1)
    end

    it '従業員のページにリダイレクトすること' do
      delete :destroy, params: { id: document.id }
      expect(response).to redirect_to(employee_path(employee))
    end
  end
end
