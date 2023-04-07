Rails.application.routes.draw do
  devise_for :users 
  get 'recipes'  => 'recipes#index', as: :recipes
  get 'recipes/:id' => 'recipes#show', as: :recipes_detail
  delete 'recipes/:id' => 'recipes#destroy', as: :recipes_destroy
  get 'recipes/new'
  get 'recipes/create'
  post 'recipes/:id/toggle'  => 'recipes#toggle', as: :toggle_public

  # resources :recipes do
  #   patch 'update_public', on: :member
  # end
  
  root "users#index"
  resources :users, only: [:index, :show]
end
