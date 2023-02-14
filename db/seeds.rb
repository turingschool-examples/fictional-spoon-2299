# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipe_1 = Recipe.create!(name: "lasagna", complexity: 2, genre: "italian")
recipe_2 = Recipe.create!(name: "Beef Tacos", complexity: 1, genre: "mexican")
recipe_3 = Recipe.create!(name: "Buffalo Wings", complexity: 1, genre: "American")
ingredient_1 = Ingredient.create!(name: "Salt", cost: 1)
ingredient_2 = Ingredient.create!(name: "Pepper", cost: 2)
ingredient_3 = Ingredient.create!(name: "Chicken", cost: 2)
ingredient_4 = Ingredient.create!(name: "Beef", cost: 2)
ingredient_5 = Ingredient.create!(name: "Cheese", cost: 2)
ingredient_6 = Ingredient.create!(name: "Buffalo Sauce", cost: 2)