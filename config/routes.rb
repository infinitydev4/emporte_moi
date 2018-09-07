Rails.application.routes.draw do
  resources :plats
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  get '/commande', to: "order#show", as: "order"
  get '/paniers', to: 'paniers#show', as: "paniers"
  post '/paniers', to: 'home#ajout_panier'
  get '/remove', to: 'paniers#remove_item', as: 'remove_item'
  post '/remove', to: 'paniers#remove_item'
  post '/', to: 'paniers#empty'
end
