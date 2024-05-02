RSpec.describe "AdminSessions", type: :request do
    describe "POST /admin/sign_in" do
      let(:admin) { FactoryBot.create(:admin) }
  
      it "正しいクレデンシャルでサインインすると、正常なリダイレクトが行われること" do
        post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
        expect(response).to redirect_to(root_path)
      end
  
      it "無効なクレデンシャルでサインインすると、エラーメッセージが表示されること" do
        post admin_session_path, params: { admin: { email: admin.email, password: "invalid_password" } }
        expect(response).to render_template(:new)
        expect(response.body).to include("Emailかパスワードが正しくありません。")
      end
    end
  end
  