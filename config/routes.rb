Rails.application.routes.draw do
  get 'search/new'
  get 'search/create'
  get 'search/show'
  resources :plats
  resources :searches 
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'

  get '/commande', to: "order#new", as: "order"
  post '/commande', to: "order#create"
  post '/reseach', to: "plats#search", as: "research"
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  get '/paniers', to: 'paniers#show', as: "paniers"
  post '/paniers', to: 'home#ajout_panier'

  get '/remove', to: 'paniers#remove_item', as: 'remove_item'
  post '/remove', to: 'paniers#remove_item'

  get '/add' ,to: 'paniers#add_item', as: 'add_item'
  post '/add' ,to: 'paniers#add_item'

  get '/destroy', to: 'paniers#destroy_item', as: 'destroy_item'
  post '/destroy', to: 'paniers#destroy_item'

  post '/', to: 'paniers#empty'
  get '/contact', to: 'home#contact'
  get '/cgu', to: 'home#cgu'
  get '/profil', to: 'home#profil', as: 'profil'
  get '/mon_restaurant', to: 'home#mon_restaurant', as: 'mon_restaurant'
  get '/mes_plats', to: 'home#mes_plats', as: 'mes_plats'
  get '/mes_commandes', to: 'home#mes_commandes', as: 'mes_commandes'
  post '/plats/new', to: 'plats#create'
  get '/particulier/:name', to: 'home#particulier', as: 'particulier'
  post '/particulier/:name', to: 'comments#create'
  resources :users do
    resources :comments
  end

  get '/restaurant/:name', to: 'home#restaurant', as: 'profil_resto'
end
