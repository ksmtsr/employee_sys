Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  # , skip: [:registrations]
  root to: "employees#index"
  resources :employees


  
  # WebpackerがビルドしたJavaScriptファイルにアクセスするためのルート
  get '/packs/js/application-468255184b399d3d4617.js', to: redirect('assets/application-468255184b399d3d4617.js')
  get '/assets/application-468255184b399d3d4617.js', to: redirect('/assets/application-468255184b399d3d4617.js')
end
