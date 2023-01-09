Rails.application.routes.draw do
  devise_for :users
  root 'himas#index'
  resources :himas, only: [:index, :new, :create]
  resources :users, only: [:show, :edit, :update]
end
