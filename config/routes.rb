Rails.application.routes.draw do
  resources :dragqueens, only: [:index]
  resources :users, only: [:index, :create, :show]
  resources :ratings, only: [:index, :create, :show, :update]
  get 'users/:id/ratings', :to => 'ratings#ratingsByUser'
end
