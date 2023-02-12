require 'rails_helper'

RSpec.describe Ingredient, type: :feature do
  let!(:gound_beef) { Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 4)}

  describe "US1: as a visitor to '/ingredients'" do
    it 'I see a list of all the ingredients including their name and cost' do
      visit '/ingredients'

      save_and_open_page
      expect(page).to have_content("Ground Beef")
      expect(page).to have_content("Salt")
      expect(page).to have_content(2)
      expect(page).to have_content(4)

    end
  end
end