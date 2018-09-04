Rails.application.routes.draw do
  root to: 'brands#index'

  resources :brands, only: [:index] do
    resources :products, only: [:index]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'


  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
