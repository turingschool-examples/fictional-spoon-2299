require 'rails_helper'

RSpec.describe 'recipes show pages' do
  let!(:pasta) { Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian") }
  let!(:noodle) { Ingredient.create!(name: 'Noodle', cost: 5) }
  let!(:cheese) { Ingredient.create!(name: 'Cheese', cost: 10) }
  let!(:egg) { Ingredient.create!(name: 'Egg', cost: 8) }

  before do
    RecipeIngredient.create!(recipe: pasta, ingredient: noodle)
    RecipeIngredient.create!(recipe: pasta, ingredient: cheese)
  end

  it 'should see the recipe and it attributes' do 
    visit "/recipes/#{pasta.id}"

    expect(page).to have_content("#{pasta.name}")
    expect(page).to have_content("#{pasta.complexity}")
    expect(page).to have_content("#{pasta.genre}")
    expect(page).to have_content("Ingredients:")
    expect(page).to have_content("-#{noodle.name}")
    expect(page).to have_content("-#{cheese.name}")
  end

  it 'should see the total cost of all ingredients for the recipe' do
    visit "/recipes/#{pasta.id}"

    expect(page).to have_content("Total Cost: #{pasta.total_cost}")
  end
end