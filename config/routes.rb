Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :carts do
      resources :orders
  end
  resources :products
  resources :carpros
  root to: 'products#index'
  resources :categories
end
