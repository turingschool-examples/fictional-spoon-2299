require 'rails_helper'

RSpec.describe 'ingredients index page' do
  it 'should see all ingredients including their name and cost' do
    @pasta = Recipe.create!(name: 'Pasta', complexity: 1, genre: "Italian")
    @fried_rice = Recipe.create!(name: 'Fried Rice', complexity: 2, genre: "Chinese")

    @noodle = Ingredient.create!(name: 'Noodle', cost: 5)
    @rice = Ingredient.create!(name: 'Rice', cost: 7)

    visit '/ingredients'

    expect(page).to have_content("#{@noodle.name}")
    expect(page).to have_content("#{@noodle.cost}")
    expect(page).to have_content("#{@rice.name}")
    expect(page).to have_content("#{@rice.cost}")
  end
end