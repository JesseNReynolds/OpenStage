Rails.application.routes.draw do
  resources :venues
  
  resources :bands
  
  resources :users
  
  resources :sessions, only: [:create, :destroy]
  get '/login', to: 'sessions#new', as 'login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
