class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def new; end

  def create; end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    puts "#{params[:public]} Public params"
    @recipe.update(public: params[:public])
    redirect_to recipes_detail_path(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy!
    redirect_to recipes_path, notice: 'Recipe has been deleted successfully!'
    
  end
end
