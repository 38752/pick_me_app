Rails.application.routes.draw do
  devise_for :users
  root 'himas#index'
  resources :himas, only: [:index, :new, :create] do
    resources :hit_ons, only: [:create]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :memos, only: [:edit, :update]
  end
  resources :rooms, only: [:index]
end
