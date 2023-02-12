# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

flour = Ingredient.create!(name: 'Flour', cost: 2)
eggs = Ingredient.create!(name: 'Eggs', cost: 6)
butter = Ingredient.create!(name: 'Butter', cost: 3)

biscuits = Recipe.create!(name: 'Biscuits', complexity: 1, genre: 'Bread')
cookies = Recipe.create!(name: 'Sugar Cookies', complexity: 1, genre: 'dessert')

biscuits_ingredients_1 = RecipeIngredient.create!(recipe: biscuits, ingredient: flour)
biscuits_ingredients_2 = RecipeIngredient.create!(recipe: biscuits, ingredient: eggs)
biscuits_ingredients_3 = RecipeIngredient.create!(recipe: biscuits, ingredient: butter)
cookies_ingredients_1 = RecipeIngredient.create!(recipe: cookies, ingredient: flour)
cookies_ingredients_2 = RecipeIngredient.create!(recipe: cookies, ingredient: eggs)
cookies_ingredients_3 = RecipeIngredient.create!(recipe: cookies, ingredient: butter)