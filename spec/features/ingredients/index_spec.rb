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
end
    