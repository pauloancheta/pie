Rails.application.routes.draw do

  root 'sessions#new'
  # facebook callback
  get '/auth/:provider/callback' => 'sessions#auth_hash', as: :omni_auth
  #LOG IN
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get '/signup' => 'users#new'
  # get '/edit_user/:id' => 'users#edit'
  # post '/edit_user/:id' => 'users#update'
  # post '/users' => 'users#create'


  post '/dishes/:dish_id/add_recipe/:id' => 'recipes#add_recipe', as: :add_recipe 
  delete '/dishes/:dish_id/remove_recipe/:id' => 'recipes#remove_recipe', as: :remove_recipe
  # delete '/dish_recipes/:id' => 'recipes#remove_recipe', as: :remove_recipe


  get '/restaurants' => 'restaurants#index'

  get '/restaurants/favourites' => 'restaurants#favourite'

  resources :users do
    resources :favourites, only:[:create, :destroy] 
    resources :menus
  end

  resources :menus, only:[] do
    resources :dishes
  end
  
  resources :recipes do
    resources :ingredients
  end 
  
  resources :preferences, only: [:show, :edit, :update]
  
end

