require 'rails_helper'

RSpec.describe "Ingredients Index Page", type: :feature do

  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Tuna", cost: 5)
    @ingredient_2 = Ingredient.create!(name: "Bell Pepper", cost: 2)
    @ingredient_3 = Ingredient.create!(name: "Poppyseed Dressing", cost: 6)
  end
  
  describe "User Story 1, as a visitor visiting '/ingredients'" do
    it 'lists all the ingredients with their name and cost' do
      visit "/ingredients"

      expect(page).to have_content("Tuna")
      expect(page).to have_content("5")
      expect(page).to have_content("Bell Pepper")
      expect(page).to have_content("2")
      expect(page).to have_content("Poppyseed Dressing")
      expect(page).to have_content("6")
    end
  end

  describe "Extension 1 - Ingredients Sorted Alphabetically" do
    it 'lists ingredients in alphebetical order' do
      visit "/ingredients"

      expect(@ingredient_2.name).to appear_before(@ingredient_3.name)
      expect(@ingredient_3.name).to appear_before(@ingredient_1.name)
    end
  end
end