require 'rails_helper'

RSpec.describe '/ingredients', type: :feature do
  # let!(:spaghetti) { Recipe.create!(name: 'Spaghetti', complexity: 3, genre: 'Italian') }
  let!(:burger_patty) { Recipe.create!(name: 'Burger Patty', complexity: 2, genre: 'American') }
  let!(:ground_beef) { Ingredient.create!(name: 'Ground Beef', cost: 8) }
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 2) }
  let!(:pepper) { Ingredient.create!(name: 'Black Pepper', cost: 3) }

  before do
    RecipeIngredient.create!(recipe: burger_patty, ingredient: ground_beef)
    RecipeIngredient.create!(recipe: burger_patty, ingredient: salt)
    RecipeIngredient.create!(recipe: burger_patty, ingredient: pepper)
  end

  it 'shows a list of all ingredients including their name and cost' do
    visit "/recipes/#{burger_patty.id}"
    
    expect(page).to have_content("Recipe: #{burger_patty.name}")
    expect(page).to have_content("Complexity: #{burger_patty.complexity}")
    expect(page).to have_content("Genre: #{burger_patty.genre}")
    expect(page).to have_content("Ingredients:")
    expect(page).to have_content("#{ground_beef.name}")
    expect(page).to have_content("#{salt.name}")
    expect(page).to have_content("#{pepper.name}")
  end

  it 'shows the total cost of all the ingredients for the recipe' do
    visit "/recipes/#{burger_patty.id}"
    
    expect(page).to have_content("Total Cost: #{burger_patty.total_cost}")
  end
end