# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

		pot_pie = Recipe.create!(name: 'Pot Pie', complexity: 6, genre: "homestyle")
    
    chicken = pot_pie.ingredients.create!(name: "chicken", cost: 8)
    mushrooms = pot_pie.ingredients.create!(name: "mushrooms", cost: 3)
    stock = pot_pie.ingredients.create!(name: "chicken stock", cost: 3)
    crust = pot_pie.ingredients.create!(name: "pie crust", cost: 4)