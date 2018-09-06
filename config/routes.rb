Rails.application.routes.draw do
  resources :paniers
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  get '/plats/:id', to: 'plats#show', as:"plats"
end
