Rails.application.routes.draw do
  devise_for :shops
  root to: 'shops#index'
end
