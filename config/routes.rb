Rails.application.routes.draw do
  devise_for :users 
  get 'recipes'  => 'recipes#index', as: :recipes
  get 'recipes/:id' => 'recipes#show', as: :recipes_detail
  delete 'recipes/:id' => 'recipes#destroy', as: :recipes_destroy
  get 'recipes/new'
  get 'recipes/create'

  get 'recipes/:id/toggle'  => 'recipes#toggle', as: :toggle_public

  # resources :recipes do
  #   patch 'update_public', on: :member
  # end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show]
end
