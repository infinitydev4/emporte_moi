Rails.application.routes.draw do
  devise_for :restaurants
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
end
