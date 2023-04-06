class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
  end

  def create
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    puts "#{params[:public]} Public params"
    @recipe.update(public: params[:public])
    redirect_to recipes_detail_path(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = "The recipe has been removed successfully."
    redirect_to recipes_url
  end
end
