Rails.application.routes.draw do
  
  root "sessions#new"

  resources :opinions, only: [:new, :index, :create, :show, :destroy]
  resources :followings, only: [:new, :create, :index,:destroy]
  resources :users , only: [:new, :index, :create,:show]
  resources :sessions, only: [:new, :index, :create,:destroy]
  resources :species, only: [:new, :index, :create]
  

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :statics, only: [:index]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
