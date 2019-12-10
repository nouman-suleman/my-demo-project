Rails.application.routes.draw do

  devise_for :users

  resources :products

  resources :products do
    resources :comments
  end

  resources :users do
    resource :cart, controller: 'cart'
  end

  root 'products#index'

end
