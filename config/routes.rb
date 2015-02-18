Rails.application.routes.draw do
  
  root 'menus#index'

  resources :menus
  
  resources :dishes do
    resources :recipes
  end

  resources :recipes, only: [] do
    resources :ingredients
  end
end
