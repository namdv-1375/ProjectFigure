Rails.application.routes.draw do
  devise_for :users
  root "admin/dashboards#index"
  get '/admin', to: 'admin/dashboards#index'
  resources :posts
  namespace :admin do
    resources :product

    as :user do
      get "signin" => "sessions#new"
      post "signin" => "sessions#create"
      delete "signout" => "sessions#destroy"
    end
  end

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end
