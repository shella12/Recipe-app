require 'rails_helper'

RSpec.feature 'RecipeList', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  before do
    login_as(user)
    recipe.save
  end

  describe 'index page' do
    it 'shows the right content' do
      visit('/recipes')
      expect(page).to have_selector('a', text: 'Recipe 1')
      expect(page).to have_selector('p', text: recipe.description.to_s)
      click_link('Remove')
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('Recipe has been deleted successfully!')
    end
  end
end
