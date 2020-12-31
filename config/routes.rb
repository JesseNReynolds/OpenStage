Rails.application.routes.draw do

  root 'application#home'

  get '/venue-with-most-gigs', to: 'venues#most_gigs', as: 'most_gigginest_venue'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#login', as: 'login'
  get '/venues/login', to: 'sessions#venue_login', as: 'venue_login'
  post '/venues/session', to: 'sessions#venue_create', as: 'venue_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/venues/:id/description', to: 'venues#description', as: 'description'
  get '/venues/signup', to: 'venues#new', as: 'venue_signup'
  resources :venues do
    resources :gigs, only: [:index]
  end

  post '/bands/gigs/new', to: 'gigs#claim_gig', as: 'claim_gig'
  resources :bands do
    resources :gigs, only: [:index]
  end

  post '/gigs/:id/accept', to: 'gigs#accept', as: 'accept_gig'
  post '/gigs/:id/decline', to: 'gigs#decline', as: 'decline_gig'
  get '/gigs/available', to: 'gigs#available', as: 'available_gigs'
  resources :gigs

  get '/users/signup', to: 'users#new', as: 'user_signup'
  post '/users/invites/accept', to: 'users#accept_invite', as: 'accept_invite'
  post '/users/bands/band_members/new', to: 'users#invite_member', as: 'invite_member'
  get '/users/invites', to: 'users#invites', as: 'user_invites'
  delete '/band_members/remove', to: 'users#remove_from_band', as: 'remove_from_band'
  delete '/band_members/leave', to: 'users#leave_band', as: 'leave_band'
  resources :users, except: [:new] do
    resources :gigs, only: [:index] 
    resources :bands, only: [:index]
  end
  get '/users/:id/bio', to: 'users#bio', as: 'bio'
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
