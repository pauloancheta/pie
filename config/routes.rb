Rails.application.routes.draw do

  #LOG IN
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # root 'menus#index'

  root 'restaurants#index'

  resources :users, only:[] do 
    resources :menus
  end
  # get 'users/:id/menus' => 'users#menu', as: 'restaurant_menu'

  resources :menus, only: [] do
    resources :dishes, only: [:create, :destroy]
  end
  resources :dishes, only: [] do
    resources :recipes
  end
  resources :recipes, only: [] do
    resources :ingredients, only: [:new, :create, :destroy]
  end

  
  resources :preferences, only: [:show, :edit, :update]
  
end
