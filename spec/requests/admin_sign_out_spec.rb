RSpec.describe "AdminSessions", type: :request do
    describe "DELETE /admin/sign_out" do
      it "ログアウト後にログイン画面にリダイレクトされること" do
        sign_in FactoryBot.create(:admin) # ログインする
        delete destroy_admin_session_path # ログアウトする
        expect(response).to redirect_to(new_admin_session_path) # ログアウト後にログイン画面にリダイレクトされることを確認
      end
    end

    describe "ログアウトしている場合" do
        it "制限されたページへアクセスするとログインページにリダイレクトされる" do
        get root_path
        expect(response).to redirect_to(new_admin_session_path) # ログインページにリダイレクトされることを確認
        end
      end
  end
  