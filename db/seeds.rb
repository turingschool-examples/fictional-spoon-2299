# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    recipe = Recipe.create!(name: 'Chili', complexity: 1, genre: 'southwestern')
    pepper = Ingredient.create!(name: 'pepper', cost: 10)
    tomato = Ingredient.create!(name: 'whole-peeled tomatoes', cost: 1)
    bean = Ingredient.create!(name: 'kidney beans', cost: 20)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: pepper.id)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: tomato.id)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bean.id)