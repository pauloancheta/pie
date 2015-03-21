Rails.application.routes.draw do

  root 'sessions#new'
  # second root. This route is used when user logs in
  get '/restaurants' => 'restaurants#index'
  get '/restaurants/favourites' => 'restaurants#favourite'

  # facebook callback
  get '/auth/:provider/callback' => 'sessions#create', as: :omni_auth

  # LOG IN
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Add recipe to dish
  post '/dishes/:dish_id/add_recipe/:id' => 'recipes#add_recipe', as: :add_recipe 
  delete '/dishes/:dish_id/remove_recipe/:id' => 'recipes#remove_recipe', as: :remove_recipe


  resources :users do
    resources :favourites, only:[:create, :destroy] 
    resources :menus
  end

  resources :menus, only:[] do
    resources :dishes
  end
  
  resources :recipes do
    resources :ingredients, only: [:index, :new, :create, :destroy]
  end 
  
  resources :preferences, only: [:show, :edit, :update]
  
  # takes out the ingredient to recipe but does not delete the ingredient itself
  delete '/recipes/:recipe_id/remove_ingredient/:ingredient_id/' => 'inclusions#destroy', as: :inclusion

  # like or unlike a dish
  post 'dish/:dish_id/add_like/:user_id' => 'likes#create', as: :like
  delete 'dish/:dish_id/remove_like/:user_id' => 'likes#destroy', as: :unlike
end

