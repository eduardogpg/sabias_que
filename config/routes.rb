Rails.application.routes.draw do
  

  devise_for :users
  get 'home/index'

  root to: "home#index"

  resources :facts
  resources :users, only: [:show]

end
