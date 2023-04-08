require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'Associations test' do
    it { should belong_to(:food) }
    it { should belong_to(:recipe) }
  end

  describe 'Validation test' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:food) }
  end
end
