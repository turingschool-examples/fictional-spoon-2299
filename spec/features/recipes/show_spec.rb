require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/recipes/:id'" do
    it "I see the recipe's name, complexity and genre," do
      spaghetti = Recipe.create!(name: "Spaghetti Bolognese", complexity: 1, genre: "Italian")
      beef = spaghetti.ingredients.create!(name: "ground beef", cost: 5)
      sauce = spaghetti.ingredients.create!(name: "tomato sauce", cost: 4)
      noods = spaghetti.ingredients.create!(name: "spaghetti noodles", cost: 3)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Spaghetti Bolognese")
      expect(page).to have_content("Complexity: 1")
      expect(page).to have_content("Genre: Italian")
    end

    it "I see a list of the names of the ingredients for the recipe." do
      spaghetti = Recipe.create!(name: "Spaghetti Bolognese", complexity: 1, genre: "Italian")
      beef = spaghetti.ingredients.create!(name: "ground beef", cost: 5)
      sauce = spaghetti.ingredients.create!(name: "tomato sauce", cost: 4)
      noods = spaghetti.ingredients.create!(name: "spaghetti noodles", cost: 3)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Ingredients List")
      expect(page).to have_content("ground beef")
      expect(page).to have_content("tomato sauce")
      expect(page).to have_content("spaghetti noodles")


    end
  
  end
end