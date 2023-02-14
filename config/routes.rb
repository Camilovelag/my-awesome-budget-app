Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users

  root "splash#index"

  resources :groups
  resources :entities
  resources :entity_groups, only: [:new, :create]
end
