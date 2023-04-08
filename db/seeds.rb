# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create([{name: "Zuhra"}])
second_user = User.create([{name: "Hashimi"}])

recipe1 = Recipe.create(name: "Banana Smoothie", preparationTime: 10, cookingTime: 0, description: "A delicious smoothie made with banana, milk and honey", public: true, user_id: 1)
recipe2 = Recipe.create(name: "Apple Pie", preparationTime: 30, cookingTime: 60, description: "A delicious pie made with apple, flour, sugar and butter", public: true, user_id: 1)
recipe3 = Recipe.create(name: "Orange Juice", preparationTime: 10, cookingTime: 0, description: "A delicious juice made with orange, sugar and water", public: true, user_id: 1)

recipe_food = RecipeFood.create(quantity: 1, recipe_id: recipe1.id, food_id: banana.id)
recipe_food2 = RecipeFood.create(quantity: 1, recipe_id: recipe2.id, food_id: apple.id)
recipe_food3 = RecipeFood.create(quantity: 1, recipe_id: recipe3.id, food_id: orange.id)
recipe_food4 = RecipeFood.create(quantity: 1, recipe_id: recipe1.id, food_id: apple.id)
recipe_food5 = RecipeFood.create(quantity: 100, recipe_id: recipe2.id, food_id: onion.id)
