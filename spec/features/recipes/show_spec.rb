require 'rails_helper'

RSpec.describe Recipe, type: :feature do 
  let!(:lasagna) {Recipe.create!(name: "Lasagna", complexity: 4, genre: "Italian")}

  let!(:ground_beef) { Ingredient.create!(name: "Ground Beef", cost: 6) }
  let!(:garlic) { Ingredient.create!(name: "Garlic", cost: 1) }
  let!(:lasagna_noods) { Ingredient.create!(name: "Lasagna Noodles", cost: 1) }
  let!(:ricotta) { Ingredient.create!(name: "Ricotta", cost: 4) }
  let!(:mushrooms) { Ingredient.create!(name: "Mushrooms", cost: 3) }

  before do 
    RecipeIngredient.create!(recipe: lasagna, ingredient: ground_beef)
    RecipeIngredient.create!(recipe: lasagna, ingredient: lasagna_noods)
    RecipeIngredient.create!(recipe: lasagna, ingredient: garlic)
    RecipeIngredient.create!(recipe: lasagna, ingredient: ricotta)
    RecipeIngredient.create!(recipe: lasagna, ingredient: mushrooms)


  end
  it 'shows the recipes name, complexity, genre, and its ingredients' do
    visit "/recipes/#{lasagna.id}"
    
    expect(page).to have_content("#{lasagna.name}")
    expect(page).to have_content("#{lasagna.complexity}")
    expect(page).to have_content("#{lasagna.genre}")

    expect(page).to have_content("Ingredients:")
    expect(page).to have_content("#{ground_beef.name}")
    expect(page).to have_content("#{garlic.name}")
    expect(page).to have_content("#{lasagna_noods.name}")
    expect(page).to have_content("#{ricotta.name}")
    expect(page).to have_content("#{mushrooms.name}")
  end
  
  it 'shows the total cost of ingredients' do
    visit "/recipes/#{lasagna.id}"
    
    expect(page).to have_content("Total Cost:")
    expect(page).to have_content("#{lasagna.ingredients.total_cost}")
  end
end