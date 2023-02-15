# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@ingredients = Ingredient.create([{name: "Onion", cost: 2}, {name: "Olives", cost: 3}, {name: "Cilantro", cost: 1}])
@recipes = Recipe.create([{name: 'Pizza', complexity: 2, genre: "Italian"}, {name: 'Garden Salad', complexity: 3, genre: "Greek"}])
RecipeIngredient.create(recipe_id: @recipes.first.id, ingredient_id: @ingredients.second.id)
RecipeIngredient.create(recipe_id: @recipes.first.id, ingredient_id: @ingredients.first.id)
RecipeIngredient.create(recipe_id: @recipes.second.id, ingredient_id: @ingredients.first.id)
RecipeIngredient.create(recipe_id: @recipes.second.id, ingredient_id: @ingredients.second.id)
RecipeIngredient.create(recipe_id: @recipes.second.id, ingredient_id: @ingredients.third.id)
require 'pry'; binding.pry