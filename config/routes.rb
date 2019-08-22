Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campsites, only: [:new, :create, :edit, :update]
  resources :campsites, only: [:show, :index] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :update]

  resources :users, only: [:show, :update]

  resources :users, only: [:show, :index] do
    resources :bookings, only: [:new, :create, :index]
  end

end
