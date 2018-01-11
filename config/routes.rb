Rails.application.routes.draw do
  devise_for :users
  resources :shrooms
  
  get 'welcome/index'
  get '/services',  to: 'welcome#services'
  get '/education', to: 'welcome#education'
  get '/about',     to: 'welcome#about'
  get '/contact',   to: 'welcome#contact'

  root 'welcome#index'
end
