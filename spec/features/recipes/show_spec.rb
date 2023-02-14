require 'rails_helper'

RSpec.describe Recipe, type: :feature do

  let!(:beef) {Ingredient.create!(name: "Ground Beef", cost: 2)}
  let!(:carrot) {Ingredient.create!(name: "Carrot", cost: 1)}
  let!(:ham) {Ingredient.create!(name: "Ham", cost: 3)}
  let!(:stew) {Recipe.create!(name: "Beef Stew", complexity: 5, genre: "Stew")}
  let!(:pie) {Recipe.create!(name: "Ham Pie", complexity: 10, genre: "Weird")}
  
  it 'shows all the attributes of all ingredients' do
    RecipeIngredient.create!(recipe: stew, ingredient: beef)
    RecipeIngredient.create!(recipe: stew, ingredient: carrot)

    visit "/recipes/#{stew.id}"

    expect(page).to have_content("#{stew.name}")
    expect(page).to have_content("#{stew.complexity}")
    expect(page).to have_content("#{stew.ingredients.first.name}")
    expect(page).to have_content("#{stew.ingredients.last.name}")
    expect(page).to have_content("#{stew.total_cost}")
  end
end