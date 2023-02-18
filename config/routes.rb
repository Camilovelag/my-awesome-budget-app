Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  devise_for :users 
  root "splash#index"
  resources :users
  resources :groups, path: :categories  do
    resources :entities, path: :transactions
  end
end
