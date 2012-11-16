OpenMIS::Application.routes.draw do

  resources :users do
    member do
      put "updateinfo"
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  #match '/:username' => 'users#show'

end
