Rails.application.routes.draw do
  resources :dragqueens, only: [:index]
  resources :users, only: [:index, :create]
  resources :ratings, only: [:index, :create]
end
