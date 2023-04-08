FactoryBot.define do
    factory :recipe do
      user
      name { Faker::Food.dish }
      preparationTime {Faker::Number.decimal(l_digits: 2) }
      cookingTime { Faker::Number.decimal(l_digits: 2) }
      description {Faker::Food.description}
    end
  end