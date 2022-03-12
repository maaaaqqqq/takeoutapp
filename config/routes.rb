Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :shops,controllers:{
    sessions: 'shops/sessions',
    passwords: 'shops/passwords',
    registrations: 'shops/registrations'
  }
  root to: 'shops#index'
  resources :shops, only: [:index, :show, :edit] do
    resources :items, only: [:show, :edit, :new, :create, :update, :destroy ]
  end
  resources :users, only: :show
end
