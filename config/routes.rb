Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]
  resources :movies, only: [:index, :show]

  namespace :admin do
    get '/dashboard', to: 'dashboard#admin_dashboard'
  end

  resources :friendships, only: [:create]
  resources :party, only: [:new, :create]
end
