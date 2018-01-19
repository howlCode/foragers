Rails.application.routes.draw do
  devise_for :users
  resources :shrooms
  resources :products, :path => "shop"
  resources :orders
  resources :order_items
  
  get 'welcome/index'
  get '/education', to: 'welcome#education'
  get '/about',     to: 'welcome#about'
  get '/contact',   to: 'welcome#contact'

  root 'welcome#index'
end
