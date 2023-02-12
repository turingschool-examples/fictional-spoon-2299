# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Recipe.destroy_all
RecipeIngredient.destroy_all

ingredient_1 = Ingredient.create!(name: "Lettuce", cost: 40)
ingredient_2 = Ingredient.create!(name: "Cheese", cost: 40)
ingredient_3 = Ingredient.create!(name: "Tomato", cost: 40)
ingredient_4 = Ingredient.create!(name: "Onion", cost: 40)


recipe_1 = Recipe.create!(name: "Salad", complexity: 9, genre: "dinner")
recipe_2 = Recipe.create!(name: "Burger", complexity: 4, genre: "lunch")

recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
