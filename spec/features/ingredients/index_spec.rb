require 'rails_helper'

RSpec.describe 'the ingredients index' do
  it 'lists all the ingredients with their costs' do
    
    chicken = Ingredient.create(name: "chicken", cost: 8)
    mushrooms = Ingredient.create(name: "mushrooms", cost: 3)

    visit "/ingredients"

    expect(page).to have_content(chicken.name)
    expect(page).to have_content(chicken.cost)
    
    expect(page).to have_content(mushrooms.name)
    expect(page).to have_content(mushrooms.cost)
	end

	it 'lists the ingredients in alphabetical order' do
		pot_pie = Recipe.create!(name: 'Pot Pie', complexity: 6, genre: "homestyle")

    stock = pot_pie.ingredients.create!(name: "stock", cost: 3)
    mushrooms = pot_pie.ingredients.create!(name: "mushrooms", cost: 3)
		chicken = pot_pie.ingredients.create!(name: "chicken", cost: 8)

		visit "/ingredients"
		expect(chicken.name).to appear_before(stock.name)
		expect(chicken.name).to appear_before(mushrooms.name)
		expect(mushrooms.name).to appear_before(stock.name)

	end
end
    