require 'rails_helper'

RSpec.describe 'the ingredients index page' do
  it 'lists all the ingredients and their attribues' do
    meat = Ingredient.create!(name: 'meat', cost: 20)
    vege = Ingredient.create!(name: 'vegetable', cost: 10)
    pasta = Ingredient.create!(name: 'pasta', cost: 5)

    visit '/ingredients'
    
    expect(page).to have_content("meat : 20")
    expect(page).to have_content("vegetable : 10")
    expect(page).to have_content("pasta : 5")
  end
end