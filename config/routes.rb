Rails.application.routes.draw do
  devise_for :users 
  root to: "homes#index"

  resources :homes do
    member do
      patch 'update_status', to: 'users#update_status'
    end
  end

  resources :addresses,   only: [:new, :create, :edit, :destroy]
  resources :supervisors, only: [:new, :create, :edit, :destroy]
  resources :works,       only: [:new, :create, :edit, :destroy]
  resources :users,       only: [:show]
end
