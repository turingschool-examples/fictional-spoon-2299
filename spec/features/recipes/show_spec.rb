require 'rails_helper'

describe 'recipe show page' do
  # User Story 2

  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.
  it 'has the recipes name, complexity and genre' do
    recipe = Recipe.create!(name: 'Chili', complexity: 1, genre: 'southwestern')
    visit "/recipes/#{recipe.id}"
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.complexity)
    expect(page).to have_content(recipe.genre)
  end

  it 'has a list of the names of the ingredients for the recipe' do
    recipe = Recipe.create!(name: 'Chili', complexity: 1, genre: 'southwestern')
    pepper = Ingredient.create!(name: 'pepper', cost: 10)
    tomato = Ingredient.create!(name: 'whole-peeled tomatoes', cost: 1)
    bean = Ingredient.create!(name: 'kidney beans', cost: 20)
    ring1 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: pepper.id)
    ring2 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: tomato.id)
    ring3 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bean.id)
    visit "/recipes/#{recipe.id}"
    expect(page).to have_content(pepper.name)
    expect(page).to have_content(tomato.name)
    expect(page).to have_content(bean.name)
  end

  #   User Story 3

  # As a visitor,
  # When I visit '/recipes/:id'
  # I see the total cost of all of the ingredients in the recipe.
  # (e.g. "Total Cost: 22")

  it 'displays the total cost' do
    recipe = Recipe.create!(name: 'Chili', complexity: 1, genre: 'southwestern')
    pepper = Ingredient.create!(name: 'pepper', cost: 10)
    tomato = Ingredient.create!(name: 'whole-peeled tomatoes', cost: 1)
    bean = Ingredient.create!(name: 'kidney beans', cost: 20)
    ring1 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: pepper.id)
    ring2 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: tomato.id)
    ring3 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bean.id)
    visit "/recipes/#{recipe.id}"
    expect(page).to have_content('Total Cost: 31')
  end
end
