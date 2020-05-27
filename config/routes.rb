Rails.application.routes.draw do

  root to: "top#index"
  get 'about' => 'session#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
end