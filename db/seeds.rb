# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@salt = Ingredient.create!(name: 'Salt', cost: 2)
@egg = Ingredient.create!(name: 'Egg', cost: 400)
@cheese = Ingredient.create!(name: 'Cheese', cost: 5)
@mushroom = Ingredient.create!(name: 'Mushroom', cost: 2)
@spinach = Ingredient.create!(name: 'Spinach', cost: 3)

@omelette = Recipe.create!(name: 'Omelette', complexity: 2, genre: "Breakfast")
@omelette.add_ingredient(@cheese)
@omelette.add_ingredient(@egg)
@omelette.add_ingredient(@salt)
@omelette.add_ingredient(@mushroom)
@omelette.add_ingredient(@spinach)