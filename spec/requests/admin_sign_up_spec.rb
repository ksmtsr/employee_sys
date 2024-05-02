RSpec.describe "AdminSignUps", type: :request do
    describe "GET /admin_sign_up" do
      it "新しい管理者を作成できること" do
        get new_admin_registration_path
        expect(response).to have_http_status(200)
      end
  
      it "正しい情報でサインアップした場合、正常なリダイレクトが行われること" do
        admin_attributes = FactoryBot.attributes_for(:admin, email: "test@example.com", password: "password123", password_confirmation: "password123")
        post admin_registration_path, params: { admin: admin_attributes }
        expect(response).to redirect_to(root_path)
      end
  
      it "重複したメールアドレスでサインアップしようとした場合、エラーが表示されること" do
        FactoryBot.create(:admin, email: "test@example.com")
        expect {
        FactoryBot.create(:admin, email: "test@example.com")
        }.to raise_error(ActiveRecord::RecordInvalid, "レコードが無効です")
        end
    end
end