require 'rails_helper'

RSpec.describe 'the recipes show page' do
  it "lists a recipe's attributes and ingredients" do
    meat = Ingredient.create!(name: 'meat', cost: 20)
    vege = Ingredient.create!(name: 'vegetable', cost: 10)
    pasta = Ingredient.create!(name: 'pasta', cost: 5)
    spagetti = Recipe.create!(name: 'spagetti', complexity: 1, genre: 'Italian')
    kebabs = Recipe.create!(name: 'kebabs', complexity: 1, genre: 'Mediterranean')
    recing1 = RecipeIngredient.create!(ingredient_id: meat.id, recipe_id: spagetti.id)
    recing2 = RecipeIngredient.create!(ingredient_id: pasta.id, recipe_id: spagetti.id)
    recing3 = RecipeIngredient.create!(ingredient_id: meat.id, recipe_id: kebabs.id)
    recing4 = RecipeIngredient.create!(ingredient_id: vege.id, recipe_id: kebabs.id)

    visit "/recipes/#{spagetti.id}"
    save_and_open_page
    expect(page).to have_content('meat')
    expect(page).to have_content('meat')
    expect(page).to have_content('meat')

  end
end