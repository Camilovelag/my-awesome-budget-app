Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users

  root "groups#index"

  resources :groups, path: :categories  do
    resources :entities, path: :transactions
  end
end
