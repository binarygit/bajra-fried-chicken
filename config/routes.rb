Rails.application.routes.draw do
  namespace :admin do
    root 'bills#index'
    resources :bills
    resources :tables
    resources :foods
  end

  root 'tables#index'

  resources :sessions
  resources :users
  resources :reservations
  resources :foods
  resources :orders
  resources :bills
  resources :tables

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
