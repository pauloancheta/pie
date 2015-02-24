Rails.application.routes.draw do

  #LOG IN
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get '/signup' => 'users#new'
  # get '/edit_user/:id' => 'users#edit'
  # post '/edit_user/:id' => 'users#update'
  # post '/users' => 'users#create'


  get '/dishes/:dish_id/add_recipe/:id' => 'recipes#add_recipe', as: :add_recipe 

  root 'restaurants#index'

  resources :users do
    resources :favourites, only:[:create, :destroy] 
    resources :menus
  end

  resources :menus, only: [] do
    resources :dishes
  end
  
  resources :recipes do
    resources :ingredients
  end 
  
  resources :preferences, only: [:show, :edit, :update]
  
end

