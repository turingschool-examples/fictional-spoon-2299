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

    expect(page).to have_content('Recipe Name: spagetti')
    expect(page).to have_content('Complexity: 1')
    expect(page).to have_content('Genre: Italian')
    expect(page).to have_content('meat')
    expect(page).to have_content('pasta')
    expect(page).to_not have_content('vegetable')
  end

  it "lists a recipe's total ingredient cost" do
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
   
    expect(page).to have_content("Total ingredient cost: 25")
  end

  # it "can add ingredients to a recipe" do
  #   meat = Ingredient.create!(name: 'meat', cost: 20)
  #   vege = Ingredient.create!(name: 'vegetable', cost: 10)
  #   pasta = Ingredient.create!(name: 'pasta', cost: 5)
  #   spagetti = Recipe.create!(name: 'spagetti', complexity: 1, genre: 'Italian')
  #   recing1 = RecipeIngredient.create!(ingredient_id: meat.id, recipe_id: spagetti.id)
  #   recing2 = RecipeIngredient.create!(ingredient_id: pasta.id, recipe_id: spagetti.id)
   
  #   visit "/recipes/#{spagetti.id}"
   
  #   fill_in("Add Ingredient(id)", with: vege.id)
  #   click_button('Submit')
  #   expect(current_path).to eq("/recipe/#{spagetti.id}")
  #   expect(page).to have_content("vegetable")
  # end
end