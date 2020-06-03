Rails.application.routes.draw do
  devise_for :users
  root "admin/dashboards#index"
  get '/admin', to: 'admin/dashboards#index'
  resources :posts
  namespace :admin do
    resources :product
    resources :users

    as :user do
      get "signup" => "registrations#new"
      post "registration" => "registrations#create"
      get "login" => "sessions#new"
      post "login" => "sessions#create"
      delete "signout" => "sessions#destroy"
    end
  end

  as :user do
    get "signup" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end
