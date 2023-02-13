# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


recipe_1 = Recipe.create!(name: ' Strip Steak', complexity: 1, genre: 'American?')

ingredient_1 = Ingredient.create!(name: 'salt', cost: 12)
ingredient_2 = Ingredient.create!(name: 'pepper', cost: 14)
ingredient_3 = Ingredient.create!(name: 'garlic', cost: 13)
ingredient_4 = Ingredient.create!(name: 'New York Strip', cost: 25)

recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
recipe_ingredient_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
recipe_ingredient_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)
recipe_ingredient_4 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4)
