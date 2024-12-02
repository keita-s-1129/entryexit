Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :prototypes, only: [:new,:create]
end
