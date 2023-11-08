Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'groups#splash', as: :unauthenticated_root
  end

  resources :groups do
    resources :transfers
  end
end
