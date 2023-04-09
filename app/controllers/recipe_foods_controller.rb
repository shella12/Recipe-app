class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @food = Food.all.where(user: current_user)
  end

  def create
    foods = params[:food]
    foods = foods.map { |food| Food.find(food) }
    quantities = params[:quantity]
    selected_checkboxes = foods.zip(quantities)
    selected_checkboxes.each do |food|
      @save = RecipeFood.new(food: food[0], recipe: Recipe.find(params[:id]), quantity: food[1].to_i)
      puts @save.errors.full_messages unless @save.save
    end
    redirect_to recipe_path(params[:id]), notice: 'Ingredients have been added'
  end

  def edit
    @recipe_food = RecipeFood.find(params[:ingredient_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:ingredient_id])
    @recipe_food.update(quantity: params[:quantity])
    redirect_to recipe_path(params[:id]), notice: 'Ingredient has been updated successfully!'
  end

  def destroy
    @recipe = RecipeFood.find(params[:ingredient_id]).destroy!
    redirect_to recipe_path(params[:id]), notice: 'Ingredient has been deleted successfully!'
  end
end
