Rails.application.routes.draw do


  # get 'playlists/new'
  post '/playlists/add' => 'playlists#add'
  resources :playlists


  get '/artists' => 'artists#index'
  get '/artists/search' => 'artists#search'
  get 'artists/new' => 'artists#new'



  root :to => 'pages#index'
  resources :users


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
