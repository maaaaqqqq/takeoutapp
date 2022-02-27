Rails.application.routes.draw do
  devise_for :shops
  root to: 'shops#index'
  resources :shops, only: [:index, :show] do
    resources :items
  end
end
