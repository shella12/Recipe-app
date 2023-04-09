Rails.application.routes.draw do
  devise_for :users 
  get 'public_recipes' => 'recipes#public_recipes', as: :public_recipes  
  root "users#index"
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
  resources :recipes do
    member do
      post :toggle_public
    end
  end
  resources :recipe_foods, only: [:edit, :update, :new, :create, :destroy]

  get '/general_shopping_list/:recipe_id', to: 'shopping_list#index', as: 'general_shopping_list'
end
