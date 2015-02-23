Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/dishes/:dish_id/add_recipe/:id' => 'recipes#add_recipe', as: :add_recipe 

  root 'menus#index'

  resources :menus do
    resources :dishes
  end
  
  resources :recipes do
    resources :ingredients
  end

  
  resources :preferences, only: [:show, :edit, :update]
  
end

