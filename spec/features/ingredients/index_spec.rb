require 'rails_helper'

RSpec.describe 'Ingredient Show Page' do

  let!(:ingredient_1) { Ingredient.create!(name: "Croutons", cost: 4) }
  let!(:ingredient_2) { Ingredient.create!(name: "Beef", cost: 200) }

  it 'shows attributes of all ingredients' do
    visit "/ingredients"

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.cost)

    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_2.cost)
  end

  it 'I see that the list of ingredients is sorted alphabetically by name' do
    visit "/ingredients"

    expect(ingredient_2.name).to appear_before(ingredient_1.name)
  end
end