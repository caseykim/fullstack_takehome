Rails.application.routes.draw do
  root 'homes#index'

  resources :videos, only: [:index, :show]
  resources :users, only: [:index, :show]
end
