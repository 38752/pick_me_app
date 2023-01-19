Rails.application.routes.draw do
  devise_for :users

  root 'himas#index'
  resources :himas, only: [:index, :new, :create] do
    resources :hit_ons, only: [:create]
  end
  resources :hit_ons, only: [:index]

  resources :users, only: [:show, :edit, :update] do
    resources :memos, only: [:edit, :update]
  end
  resources :rooms, only: [:index] do
    member do
      put 'accept'
      put 'reject'
      get 'close'
    end
    resources :messages, only: [:index, :create]
  end
end
