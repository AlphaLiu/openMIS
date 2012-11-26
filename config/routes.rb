OpenMIS::Application.routes.draw do

  get "products/searchview"
  post "products/search"

  resources :users do
    member do
      get "editinfo"
      put "updateinfo"
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index]

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  #match '/templates/modal_open', to: 'templates#modal_open'
  #match '/templates/modal_page', to: 'templates#modal_page'

end
