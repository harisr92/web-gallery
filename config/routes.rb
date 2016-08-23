Rails.application.routes.draw do
  get 'images/show'

  root 'static_pages#home'
  get 'static_pages/home'
  get '/signup', to:'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/gallery', to: 'images#show'
  get '/upload', to: 'images#new'
  post '/upload', to: 'images#create'

  resources :users
  resources :images,  only: [:create, :destroy]
end
