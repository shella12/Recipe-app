require 'rails_helper'

RSpec.feature 'RecipeList', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  let(:recipe_food) { FactoryBot.create(:recipe_food, recipe:) }

  before do
    login_as(user)
    recipe.save
    recipe_food.save
  end

  describe 'index page' do
    it 'shows the right content' do
      visit("/recipes/#{recipe.id}")
      expect(page).to have_selector('h1', text: recipe.name.to_s)
      expect(page).to have_selector('p', text: "Preparation time: #{recipe.preparationTime} hours")
      expect(page).to have_selector('p', text: "Cooking time: #{recipe.cookingTime} hours")
      expect(page).to have_content(recipe.description.to_s)
      click_link('Edit')
      sleep(1)
      expect(current_path).to eq(edit_recipe_food_path(id: recipe.id))
      click_link('Delete')
      expect(page).to have_content('Ingredient has been deleted successfully!')
    end
  end
end
