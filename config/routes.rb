Rails.application.routes.draw do
  get 'recipe_foods/edit'
  get 'recipe_foods/update'
  get 'recipe_foods/destroy'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  devise_for :users 
  get 'public_recipes' => 'recipes#public_recipes', as: :public_recipes
  get 'recipes'  => 'recipes#index', as: :recipes
  get 'recipes/:id' => 'recipes#show', as: :recipes_detail
  post 'recipes' => 'recipes#new', as: :new_recipe
  post 'recipes/create' => 'recipes#create', as: :add_new_recipe
  delete 'recipes/:id' => 'recipes#destroy', as: :recipes_destroy
  post 'recipes/:id/toggle'  => 'recipes#toggle', as: :toggle_public
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
  get '/general_shopping_list/:recipe_id', to: 'shopping_list#index', as: 'general_shopping_list'
end
