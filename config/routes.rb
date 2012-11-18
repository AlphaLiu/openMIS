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

  match '/templates/modal_open', to: 'templates#modal_open'
  match '/templates/modal_page', to: 'templates#modal_page'

end
