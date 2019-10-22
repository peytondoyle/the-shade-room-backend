Rails.application.routes.draw do
  resources :dragqueens, only: [:index]
  resources :users, only: [:index, :create, :show]
  resources :ratings, only: [:index, :create, :show, :update]
  post 'ratings/:id/edit', :to => 'ratings#update'
  get 'users/:id/ratings', :to => 'ratings#ratingsByUser'
  get 'dragqueens/:id/ratings', :to => 'ratings#getAllQueenRatings'
end
