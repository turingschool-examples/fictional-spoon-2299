require 'rails_helper'

RSpec.describe 'the recipe show page' do
  it 'shows a recipe and all of its attributes' do
		pot_pie = Recipe.create!(name: 'Pot Pie', complexity: 6, genre: "homestyle")
    
    chicken = pot_pie.ingredients.create!(name: "chicken", cost: 8)
    mushrooms = pot_pie.ingredients.create!(name: "mushrooms", cost: 3)
    stock = pot_pie.ingredients.create!(name: "chicken stock", cost: 3)
    crust = pot_pie.ingredients.create!(name: "pie crust", cost: 4)

    visit "/recipes/#{pot_pie.id}"

    expect(page).to have_content(pot_pie.name)
    expect(page).to have_content(pot_pie.complexity)
    expect(page).to have_content(pot_pie.genre)
    expect(page).to have_content(chicken.name)    
    expect(page).to have_content(mushrooms.name)
    expect(page).to have_content(stock.name)
    expect(page).to have_content(crust.name)
	end
end