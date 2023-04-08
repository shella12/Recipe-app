FactoryBot.define do
    factory :recipe do
      name { Faker::Food.dish }
      description { Faker::Food.description }
      preparationTime { Faker::Number.between(from: 1, to: 60) }
      cookingTime { Faker::Number.between(from: 1, to: 60) }
      user
    end
  end
  