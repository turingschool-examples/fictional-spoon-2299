require 'rails_helper'

RSpec.describe '/ingredients', type: :feature do
  let!(:ground_beef) { Ingredient.create!(name: 'Ground Beef', cost: 8) }
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 2) }

  it 'shows a list of all ingredients including their name and cost' do
    visit '/ingredients'
    
    expect(page).to have_content("#{ground_beef.name}: #{ground_beef.cost}")
    expect(page).to have_content("#{salt.name}: #{salt.cost}")
  end
end