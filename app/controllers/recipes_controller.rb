class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(user: current_user, name: params[:name], preparationTime: params[:prep],
                         cookingTime: params[:cooking], description: params[:description], public: true)
    return unless @recipe.save

    redirect_to recipes_path, notice: 'New recipe has been added successfully!'
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes_food = RecipeFood.all.where(recipe: @recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy!
    redirect_to recipes_path, notice: 'Recipe has been deleted successfully!'
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)
    redirect_to recipe_path(params[:id])
  end

  def public_recipes
    @recipes = Recipe.all.where(public: true)
  end
end
