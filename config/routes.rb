Rails.application.routes.draw do

  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:show]
end
