require 'rails_helper'

describe 'ingredients index' do
  #   As a visitor,
  #   When I visit '/ingredients'
  #   I see a list of all the ingredients including their name and cost
  #   (e.g. "Ground Beef: 2"
  #      "Salt: 4")
  it 'should list all of the ingredients and their cost' do
    pepper = Ingredient.create!(name: 'pepper', cost: 10)
    milk = Ingredient.create!(name: 'milk', cost: 1)
    sausage = Ingredient.create!(name: 'sausage', cost: 20)
    visit '/ingredients'
    expect(page).to have_content("#{pepper.name}: #{pepper.cost}")
    expect(page).to have_content("#{milk.name}: #{milk.cost}")
    expect(page).to have_content("#{sausage.name}: #{sausage.cost}")
  end

  # Extension 1
  # Ingredients Sorted Alphabetically

  # As a visitor,
  # When I visit '/ingredients',
  # Then I see that the list of ingredients is sorted alphabetically by name

  it 'has ingredients sorted alphabetically' do
    pepper = Ingredient.create!(name: 'pepper', cost: 10)
    milk = Ingredient.create!(name: 'milk', cost: 1)
    sausage = Ingredient.create!(name: 'sausage', cost: 20)
    visit '/ingredients'
    expect(milk.name).to appear_before(pepper.name)
    expect(pepper.name).to appear_before(sausage.name)
  end
end
