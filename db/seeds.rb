# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@recipe_1 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
@recipe_2 = Recipe.create!(name: "Cheese Pizza", complexity: 3, genre: "Italian")
@recipe_3 = Recipe.create!(name: "Chicken Pad Thai", complexity: 4, genre: "Asian")
@ing_1 = Ingredient.create!(name: "Noodles", cost: 3)
@ing_2 = Ingredient.create!(name: "Salt", cost: 1)
@ing_3 = Ingredient.create!(name: "Sauce", cost: 5)
@ing_4 = Ingredient.create!(name: "Mozzarella Cheese", cost: 10)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ing_3.id)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ing_4.id)