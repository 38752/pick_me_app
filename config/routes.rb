Rails.application.routes.draw do
  devise_for :users
  root 'himas#index'
  resources :himas, only: [:index, :new, :create]
  resources :users, only: [:show, :edit, :update] do
    resources :memos, only: [:edit, :update]
  end
end
