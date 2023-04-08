class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes_food = RecipeFood.all.where(recipe: @recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy!
    redirect_to recipes_path, notice: 'Recipe has been deleted successfully!'
  end

  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)
    redirect_to recipes_detail_path(params[:id])
  end
end
