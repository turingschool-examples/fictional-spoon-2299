require 'rails_helper'

RSpec.describe 'Recipe Show page' do

  let!(:recipe) { Recipe.create!(name: "Salad", complexity: 9, genre: "dinner") }

  let!(:ingredient_1) { Ingredient.create!(name: "Croutons", cost: 4) }
  let!(:ingredient_2) { Ingredient.create!(name: "Beef", cost: 200) }

  let!(:recipe_ingredient_1) { RecipeIngredient.create!(recipe: recipe, ingredient: ingredient_1) }
  let!(:recipe_ingredient_2) { RecipeIngredient.create!(recipe: recipe, ingredient: ingredient_2) }

  
  it "I see the recipe's name, complexity and genre" do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.complexity)
    expect(page).to have_content(recipe.genre)
  end

  it "I see a list of the names of the ingredients for the recipe" do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end

  it 'I see the total cost of all of the ingredients in the recipe' do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(ingredient_1.cost + ingredient_2.cost)
  end
end