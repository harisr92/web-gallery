Rails.application.routes.draw do
  get 'comments/create'

  root 'static_pages#home'
  get 'static_pages/home'
  get '/signup', to:'users#new'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/upload', to: 'images#new'
  post '/upload', to: 'images#create'

  resources :users
  resources :images
  resources :comments
end
