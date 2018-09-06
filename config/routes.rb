Rails.application.routes.draw do

  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  get '/commande', to: "order#show", as: "order"
  get '/paniers', to: 'paniers#show', as: "paniers"
  post '/paniers', to: 'home#ajout_panier'
end
