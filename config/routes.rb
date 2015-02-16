Rails.application.routes.draw do
  root 'home#index'
  
  resources :dishes do
    resources :recipes
  end

  resources :recipes, only: [] do
    resources :ingredients
  end
end
