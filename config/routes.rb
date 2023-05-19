Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  namespace :api, defaults: { format: 'json' } do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index new show] do
        resources :comments, only: %i[index create]
      end
    end
  end
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end
end
