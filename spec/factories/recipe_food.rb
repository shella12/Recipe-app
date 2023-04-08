FactoryBot.define do
    factory :recipe_food do
      food 
      recipe
      quantity { Faker::Number.number(digits: 2) }
    end
  end