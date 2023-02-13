# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@ingredient_1 = Ingredient.create!(name: 'Ground Beef', cost: 2)
@ingredient_2 = Ingredient.create!(name: 'Salt', cost: 4)
@ingredient_3 = Ingredient.create!(name: 'Squash', cost: 1)
@ingredient_4 = Ingredient.create!(name: 'Salmon', cost: 7)
@ingredient_5 = Ingredient.create!(name: 'Cheese', cost: 3)

@recipe_1 = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
@recipe_2 = Recipe.create!(name: "Salmon", complexity: 1, genre: "Fish")
@recipe_3 = Recipe.create!(name: "Bread", complexity: 3, genre: "French")
