WhsVote::Application.routes.draw do
  root to: 'static_pages#home'
  
  resources :students, except: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :votes,    only: [:create]
  # resources :profiles, only: [:create, :edit, :update]

  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  match '/create',  to: 'students#new'

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
