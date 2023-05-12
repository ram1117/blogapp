Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create show]
  end

  resources :posts, only: %i[index] do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create]
  end
end
