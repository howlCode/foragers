Rails.application.routes.draw do
  devise_for :users
  resources :shrooms
  resources :products, :path => "shop"
  
  resources :orders do
    member do
      get :confirm
    end
  end

  resources :order_items
  resources :addresses
  resources :credit_cards
  resources :courses 

  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"

  post 'courses/:id/attend' => "courses#attend", as: "courses_attend"

  get 'welcome/index'
  get '/education', to: 'welcome#education'
  get '/about',     to: 'welcome#about'
  get '/contact',   to: 'welcome#contact'

  root 'welcome#index'
end
