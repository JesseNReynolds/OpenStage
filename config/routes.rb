Rails.application.routes.draw do

  root 'application#home'

  resources :venues
  
  resources :bands
  
  resources :users
  get '/users/:id/bio', to: 'users#bio', as: 'bio'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
