Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
 
  root to: "employees#index"
  resources :employees do
    resources :documents, only: [:create, :destroy]
    post 'employee_documents' => 'documents#create', as: :employee_documents # ファイルのアップロード用のルートを追加
    collection do
      delete :batch_delete
    end
  end

  delete 'delete_document/:id' => 'documents#destroy', as: :delete_document
  
  # WebpackerがビルドしたJavaScriptファイルにアクセスするためのルート
  get '/packs/js/application-468255184b399d3d4617.js', to: redirect('assets/application-468255184b399d3d4617.js')
  get '/assets/application-468255184b399d3d4617.js', to: redirect('/assets/application-468255184b399d3d4617.js')
end
