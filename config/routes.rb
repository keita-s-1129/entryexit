Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :homes
  resources :addresses,   only: [:new, :create, :edit, :destroy]
  resources :supervisors, only: [:new, :create, :edit, :destroy]
  resources :works,       only: [:new, :create, :edit, :destroy]
end
