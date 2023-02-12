require 'rails_helper'

RSpec.describe 'Ingredient Show Page' do

  let!(:ingredient_1) { Ingredient.create!(name: "Croutons", cost: 4) }
  let!(:ingredient_2) { Ingredient.create!(name: "Beef", cost: 200) }

  it 'shows attributes of all ingredients' do
    visit "/ingredients"

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end