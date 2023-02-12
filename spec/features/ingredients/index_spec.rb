require 'rails_helper'

RSpec.describe 'the ingredients index page', type: :feature do
  it 'lists all the ingredients and their attribues' do
    meat = Ingredient.create!(name: 'meat', cost: 20)
    vege = Ingredient.create!(name: 'vegetable', cost: 10)
    pasta = Ingredient.create!(name: 'pasta', cost: 5)

    visit '/ingredients'
    
    expect(page).to have_content("meat : 20")
    expect(page).to have_content("vegetable : 10")
    expect(page).to have_content("pasta : 5")
  end

  it 'the list of ingredients is sorted alphabetically by name' do
    meat = Ingredient.create!(name: 'meat', cost: 20)
    vege = Ingredient.create!(name: 'vegetable', cost: 10)
    pasta = Ingredient.create!(name: 'pasta', cost: 5)
    cheese = Ingredient.create!(name: 'cheese', cost: 15)

    visit '/ingredients'
    save_and_open_page
    expect(cheese.name).to appear_before(meat.name)
    expect(meat.name).to appear_before(pasta.name)
    expect(pasta.name).to appear_before(vege.name)
  end
end