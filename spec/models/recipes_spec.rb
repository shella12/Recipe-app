require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Associations test' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
  end

  describe 'Validation test' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:preparationTime) }
    it { should validate_presence_of(:cookingTime) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:public) }
  end
end
