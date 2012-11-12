OpenMIS::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/templates/all_users', to: 'templates#all_users'
end
