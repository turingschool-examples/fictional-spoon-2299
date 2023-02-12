# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@recipe_1 = Recipe.create!(name: "Taco Meat", complexity: 1, genre: "Mexican")

@ingredient_1 = @recipe_1.ingredients.create!(name: "Ground Beef", cost: 4)
@ingredient_2 = @recipe_1.ingredients.create!(name: "Salt", cost: 1)
@ingredient_3 = @recipe_1.ingredients.create!(name: "Taco Seasoning", cost: 2)
