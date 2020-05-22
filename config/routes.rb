Rails.application.routes.draw do
  devise_for :users
  # root "admin/dashboards#index"
  get '/admin', to: 'admin/dashboards#index'
  resources :posts
  namespace :admin do
    resources :product
  end
end
