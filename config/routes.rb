Rails.application.routes.draw do
  devise_for :users
  resources :shrooms
  resources :categories, :path => "shop" do
  	resources :products
  end
  
  get 'welcome/index'
  get '/services',  to: 'welcome#services'
  get '/education', to: 'welcome#education'
  get '/about',     to: 'welcome#about'
  get '/contact',   to: 'welcome#contact'

  root 'welcome#index'
end
