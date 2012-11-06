OpenMIS::Application.routes.draw do
  resources :users

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
end
