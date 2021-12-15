Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :carts
  resources :orders
  resources :products
  resources :carpros
  root to: 'products#index'
  get "/speakers", to: "products#speakers", as: :speakers
  get "/headphones", to: "products#headphones", as: :headphones
  get "/earphones", to: "products#earphones", as: :earphones
  get "/checkout", to: "pages#checkout", as: :checkout
end
