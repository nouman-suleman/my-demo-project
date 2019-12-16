Rails.application.routes.draw do

  devise_for :users

  resources :products

  resources :products do
    resources :comments, only: [:create, :edit, :destroy]
    resources :line_items, only: [:create, :destroy]
  end

  resources :users do
    resource :cart, controller: 'cart', only: [:create, :show, :destroy]
  end

  resources :orders, only: [:create, :show, :destroy]

  root 'products#index'

end
