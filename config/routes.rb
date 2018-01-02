Rails.application.routes.draw do
  get 'welcome/index'
  get '/services',  to: 'welcome#services'
  get '/education', to: 'welcome#education'
  get '/about',     to: 'welcome#about'
  get '/contact',   to: 'welcome#contact'

  get '/database',  to: 'database#index'

  root 'welcome#index'
end
