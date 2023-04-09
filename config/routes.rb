Rails.application.routes.draw do
  devise_for :users 
  get 'public_recipes' => 'recipes#public_recipes', as: :public_recipes
  get 'recipes/:id/new' => 'recipe_foods#new', as: :new_ingredients
  post 'recipes/:id/create' => 'recipe_foods#create', as: :add_ingredients
  delete 'recipes/:id/recipe_foods/:ingredient_id' => 'recipe_foods#destroy', as: :recipes_food_destroy
  get 'recipes/:id/edit/:ingredient_id' => 'recipe_foods#edit', as: :edit_ingredients
  patch 'recipes/:id/edit/:ingredient_id' => 'recipe_foods#update', as: :update_ingredients

  # resources :recipes do
  #   patch 'update_public', on: :member
  # end
  
  root "users#index"
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
  resources :recipes do
    member do
      post :toggle_public
    end
  end

  get '/general_shopping_list/:recipe_id', to: 'shopping_list#index', as: 'general_shopping_list'
end
