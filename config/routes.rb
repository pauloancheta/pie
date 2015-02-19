Rails.application.routes.draw do


  root 'dishes#index'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :dishes do
    resources :recipes
  end

  resources :recipes, only: [] do
    resources :ingredients
  end
end
