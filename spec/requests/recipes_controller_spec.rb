require 'rails_helper'
require_relative '../support/controller_auth'

RSpec.describe 'recipes', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  let(:recipe_food) { FactoryBot.create(:recipe_food, recipe:) }
  before do
    login_as(user)
    recipe.save
  end
  describe 'GET#index' do
    it 'returns http success' do
      get '/recipes'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET#show' do
    it 'returns http success' do
      get recipe_path(recipe.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE#destroy' do
    it 'returns http success' do
      delete recipe_food_path(recipe_food.id)
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET#public_recipes' do
    it 'returns http success' do
      get public_recipes_path
      expect(response).to have_http_status(:success)
    end
  end
end
