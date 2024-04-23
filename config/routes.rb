Rails.application.routes.draw do
  devise_for :admins
  # , skip: [:registrations]
  root to: "employees#index"

  # WebpackerがビルドしたJavaScriptファイルにアクセスするための適切なルートを設定
  get '/packs/js/application-468255184b399d3d4617.js', to: redirect('assets/application-468255184b399d3d4617.js')
  get '/assets/application-468255184b399d3d4617.js', to: redirect('/assets/application-468255184b399d3d4617.js')
end
