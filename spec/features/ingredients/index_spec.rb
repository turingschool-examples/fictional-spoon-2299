require 'rails_helper'

RSpec.describe Ingredient, type: :feature do 
  let!(:ground_beef) { Ingredient.create!(name: "Ground Beef", cost: 6) }
  let!(:garlic) { Ingredient.create!(name: "Garlic", cost: 1) }

  it 'shows the attributes of all ingredients' do 
    visit '/ingredients'
    
    expect(page).to have_content("#{ground_beef.name}: #{ground_beef.cost}")
    expect(page).to have_content("#{garlic.name}: #{garlic.cost}")
  end
end