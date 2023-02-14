require 'rails_helper'

RSpec.describe Ingredient, type: :feature do

  let!(:beef) {Ingredient.create!(name: "Ground Beef", cost: 2)}
  let!(:carrot) {Ingredient.create!(name: "Carrot", cost: 1)}
  let!(:ham) {Ingredient.create!(name: "Ham", cost: 3)}

  it 'shows all the attributes of all ingredients' do
    visit '/ingredients'

    expect(page).to have_content("#{beef.name}")
    expect(page).to have_content("#{beef.cost}")
    expect(page).to have_content("#{carrot.name}")
    expect(page).to have_content("#{carrot.cost}")
  end
end