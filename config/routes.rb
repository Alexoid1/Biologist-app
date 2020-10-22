Rails.application.routes.draw do
  
  root "sessions#new"

  resources :opinions
  resources :followings, only: [:new, :create, :index,:destroy]
  resources :users
  resources :sessions, only: [:new,:create,:destroy]
  resources :species
  

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :statics, only: [:index]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
