require 'rails_helper'

RSpec.describe 'recipe show page' do
  describe "when I visit /recipes/:id" do
    it 'Shows a recipies name, complexity, genre, and ingredients' do
      recipe_1 = Recipe.create!(name: 'Strip Steak', complexity: 1, genre: 'American?')
      ingredient_1 = Ingredient.create!(name: 'salt', cost: 12)
      ingredient_2 = Ingredient.create!(name: 'pepper', cost: 14)
      ingredient_3 = Ingredient.create!(name: 'garlic', cost: 13)
      ingredient_4 = Ingredient.create!(name: 'New York Strip', cost: 25)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4)

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content(recipe_1.name)
      expect(page).to have_content(recipe_1.complexity)
      expect(page).to have_content(recipe_1.genre)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)
    end 

    it 'shows the total cost of recipe ingredients' do
      recipe_1 = Recipe.create!(name: 'Strip Steak', complexity: 1, genre: 'American?')
      ingredient_1 = Ingredient.create!(name: 'salt', cost: 12)
      ingredient_2 = Ingredient.create!(name: 'pepper', cost: 14)
      ingredient_3 = Ingredient.create!(name: 'garlic', cost: 13)
      ingredient_4 = Ingredient.create!(name: 'New York Strip', cost: 25)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4)

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content(recipe_1.name)
      expect(page).to have_content(recipe_1.complexity)
      expect(page).to have_content(recipe_1.genre)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)
      expect(page).to have_content(recipe_1.total_cost)

    end
  end 
end 