require 'rails_helper'

RSpec.describe '/recipes/:id', type: :feature do
  let!(:pizza) { Recipe.create!(name: "pizza", complexity: 3, genre: "Yummy") }

  let!(:tomato) { Ingredient.create!(name: "tomato", cost: 2) }
  let!(:mozzarella) { Ingredient.create!(name: "mozzarella", cost: 5) }
  let!(:garlic) { Ingredient.create!(name: "garlic", cost: 1) }

  let!(:recipe_ingredient1) { RecipeIngredient.create!(recipe: pizza, ingredient: tomato) }
  let!(:recipe_ingredient2) { RecipeIngredient.create!(recipe: pizza, ingredient: mozzarella) }
  let!(:recipe_ingredient3) { RecipeIngredient.create!(recipe: pizza, ingredient: garlic) }

  it 'US2 - should display recipe name, attributes, & all ingredients' do
    visit "/recipes/#{pizza.id}"

    expect(page).to have_content("Recipe for #{pizza.name}")
    expect(page).to have_content("Complexity: #{pizza.complexity}")
    expect(page).to have_content("Genre: #{pizza.genre}")
    expect(page).to have_content("Must-Have Ingredients:")
    expect(page).to have_content("-#{tomato.name}")
    expect(page).to have_content("-#{mozzarella.name}")
    expect(page).to have_content("-#{garlic.name}")
  end

  it 'US3 - should display total cost of all ingredients' do
    visit "/recipes/#{pizza.id}"

    expect(page).to have_content("Total Cost: #{pizza.total_cost}")
  end
end
