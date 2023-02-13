# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pasta = Recipe.create!(name: 'Pasta', complexity: 1, genre: "Italian")
fried_rice = Recipe.create!(name: 'Fried Rice', complexity: 2, genre: "Chinese")

noodle = Ingredient.create!(name: 'Noodle', cost: 5)
rice = Ingredient.create!(name: 'Rice', cost: 7)
egg = Ingredient.create!(name: 'Egg', cost: 3)

RecipeIngredient.create!(recipe: pasta, ingredient: noodle)
RecipeIngredient.create!(recipe: pasta, ingredient: egg)
