Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :homes,       only: [:new,:create]
  resources :addresses,   only: [:new, :create]
  resources :supervisors, only: [:new, :create]
  resources :works,       only: [:new, :create]
end
