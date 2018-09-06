Rails.application.routes.draw do
  resources :paniers
  resources :plats
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  get '/commande', to: "order#show", as: "order"
end
