require 'rails_helper'

RSpec.describe '/ingredients', type: :feature do
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 2) }
  let!(:ground_beef) { Ingredient.create!(name: 'Ground Beef', cost: 8) }
  let!(:pepper) { Ingredient.create!(name: 'Black Pepper', cost: 3) }

  it 'shows a list of all ingredients including their name and cost' do
    visit '/ingredients'
    save_and_open_page
    expect(page).to have_content("#{ground_beef.name}: #{ground_beef.cost}")
    expect(page).to have_content("#{salt.name}: #{salt.cost}")
  end

  it 'lists the ingredients sorted alphabetically by name' do
    visit '/ingredients'

    expect(pepper.name).to appear_before(ground_beef.name)
    expect(ground_beef.name).to appear_before(salt.name)
  end
end