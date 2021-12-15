Rails.application.routes.draw do
  resources :favorites
  resources :favorites, only: [:index]
  resources :favorites, only: [:create, :destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
root 'tops#index'
  resources :comments
  resources :blogs
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
