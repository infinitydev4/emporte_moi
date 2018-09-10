Rails.application.routes.draw do
  resources :plats
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  get '/commande', to: "order#new", as: "order"
  get '/paniers', to: 'paniers#show', as: "paniers"
  post '/paniers', to: 'home#ajout_panier'
  get '/remove', to: 'paniers#remove_item', as: 'remove_item'
  post '/remove', to: 'paniers#remove_item'
  post '/', to: 'paniers#empty'
  get '/contact', to: 'home#contact'
  get '/cgu', to: 'home#cgu'
  get '/profil', to: 'home#profil', as: 'profil'
  get '/mon_restaurant', to: 'home#mon_restaurant', as: 'mon_restaurant'
  get '/mes_plats', to: 'home#mes_plats', as: 'mes_plats'
  get '/mes_commandes', to: 'home#mes_commandes', as: 'mes_commandes'
end
