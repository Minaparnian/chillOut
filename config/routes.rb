Rails.application.routes.draw do


  get '/artists' => 'artists#index'
  get '/artists/search' => 'artists#search'
  get 'artists/new' => 'artists#new'

  get 'artists/show'

  root :to => 'pages#index'
  resources :users


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
