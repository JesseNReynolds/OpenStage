Rails.application.routes.draw do

  root 'application#home'

  post 'users/bands/band_members/new', to: 'bands#invite_member', as: 'invite_member'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#login', as: 'login'
  get '/venues/login', to: 'sessions#venue_login', as: 'venue_login'
  post '/venues/session', to: 'sessions#venue_create', as: 'venue_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/venue/:id/description', to: 'venues#description', as: 'description'
  resources :venues do
    resources :gigs, only: [:index]
  end

  post 'bands/gigs/new', to: 'bands#claim_gig', as: 'claim_gig'
  resources :bands do
    resources :gigs, only: [:index]
  end

  post '/gigs/accept', to: 'gigs#accept', as: 'accept_gig'
  post '/gigs/deny', to: 'gigs#deny', as: 'deny_gig'
  get '/gigs/available', to: 'gigs#available', as: 'available_gigs'
  resources :gigs

  resources :users
  get '/users/:id/bio', to: 'users#bio', as: 'bio'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
