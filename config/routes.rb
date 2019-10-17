Rails.application.routes.draw do
  resources :dragqueens, only: [:index]
end
