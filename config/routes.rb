Rails.application.routes.draw do
  devise_for :admins
  # , skip: [:registrations]
  root to: "employees#index"
  get '/employees/new', to: 'employees#new', as: 'regist'
  resources :employees, onry: [:new, :create, :index, :show, :destroy]

  # WebpackerがビルドしたJavaScriptファイルにアクセスするためのルート
  get '/packs/js/application-468255184b399d3d4617.js', to: redirect('assets/application-468255184b399d3d4617.js')
  get '/assets/application-468255184b399d3d4617.js', to: redirect('/assets/application-468255184b399d3d4617.js')
end
