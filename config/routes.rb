Rails.application.routes.draw do


  get 'artist/index'

  get 'artist/new'

  get 'artist/show'

  root :to => 'pages#index'
  resources :users


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
