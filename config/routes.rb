Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root 'menus#index'

  resources :menus do
    resources :dishes
  end
  
  resources :dishes, only: [] do
    resources :recipes
  end

  resources :recipes, only: [] do
    resources :ingredients
  end

  
  resources :preferences
  
end
