Rails.application.routes.draw do

  root 'application#home'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#login', as: 'login'
  get '/venues/login', to: 'sessions#venue_login', as: 'venue_login'
  post '/venues/session', to: 'sessions#venue_create', as: 'venue_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :venues do
    resources :gigs, only: [:index]
  end
  get '/venues/:id/description', to: 'venue#description', as: 'description'

  
  resources :bands do
    resources :gigs, only: [:index]
  end
  
  resources :gigs

  resources :users
  get '/users/:id/bio', to: 'users#bio', as: 'bio'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
