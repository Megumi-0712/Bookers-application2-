Rails.application.routes.draw do

  resources :posts
  root to: "top#index"
  get "home/about" => "top#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
end