# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@ratatouille = Recipe.create!(name: "Ratatouille", complexity: 3, genre: "Italian")
@sandwich = Recipe.create!(name: "Sandwich", complexity: 1, genre: "Broke Food")
@mac_and_cheese = Recipe.create!(name: "Mac-and-cheese", complexity: 2, genre: "Broke Food")

@tomato = @ratatouille.ingredients.create!(name: "tomato", cost: 2)
@salt = @ratatouille.ingredients.create!(name: "salt", cost: 3)
@turkey = @ratatouille.ingredients.create!(name: "turkey", cost: 15)
@bread = @sandwich.ingredients.create!(name: "bread", cost: 5)
@mayo = @sandwich.ingredients.create!(name: "mayonnaise", cost: 7)
@bologna = @sandwich.ingredients.create!(name: "bologna", cost: 11)
@milk = @mac_and_cheese.ingredients.create!(name: "milk", cost: 6)
@cheese = @mac_and_cheese.ingredients.create!(name: "cheese powder", cost: 5)
@pasta = @mac_and_cheese.ingredients.create!(name: "pasta", cost: 7)
