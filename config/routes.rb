Rails.application.routes.draw do
  devise_for :accounts, skip: [:password]
  resources :posts, only: [:new, :create, :show]
  #resources :users

  get 'accounts/index'
  get 'accounts/show'
  get 'public/homepage'
  
  root 'accounts#index'
  
  get "/dashboard" => "accounts#index"
  get "profile/:username" => "accounts#profile", as: :profile
  post "follow/account" => "accounts#follow_account", as: :follow_account

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
