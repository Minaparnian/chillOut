Rails.application.routes.draw do


  # get 'playlists/new'
  post '/playlists/add' => 'playlists#add'
  delete '/playlists/:id/remove/:track_id' => 'playlists#remove', :as => 'remove_track'
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
