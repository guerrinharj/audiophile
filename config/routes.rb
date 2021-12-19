Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :carts do
    resources :orders
    get '/checkout', to: 'pages#checkout', as: :checkout
  end
  resources :products do
    resources :carpros, only: [:create]
  end
  resources :carpros, only: [:destroy]

  root to: 'products#index'
  resources :categories
end
