Rails.application.routes.draw do
  
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
end
