Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :transfers
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
