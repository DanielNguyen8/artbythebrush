Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get "artists/:id", to: 'pages#profile', as: "artist"
  resources :users, only: [] do
    resources :follows, only: [:new, :create]
  end
  resources :galleries
  
  resources :users
  resources :pages
  
  resources :artworks do
    resources :favourites, only: [:create]
    resources :likes, only: [:create]
  end
  resources :favourites, only: [:new] do
    resources :collections_favourites
  end
  
  resources :favourites, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :collections
  
  
end
