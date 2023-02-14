require 'rails_helper'

RSpec.describe Ingredients, type: :feature do
  let!(:cilantro) { Ingredient.create!(name: "Cilantro", cost: 1) }
  let!(:onion) { Ingredient.create!(name: "Onion", cost: 2) }
  let!(:olives) { Ingredient.create!(name: "Olives", cost: 3) }
  let!(:spaghetti) { Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian") }
  let!(:pizza) { Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian") }
  let!(:garden_salad) { Recipe.create!(name: "Garden Salad", complexity: 2, genre: "Greek") }

  describe 'As a visitor,' do
    context "when I visit '/ingredients'," do
      it "I see a list of all the ingredients including their name and cost" do
        visit '/ingredients'

        expect(page).to have_content("Ingredients:")
        expect(page).to have_content(cilantro.name)
        expect(page).to have_content(cilantro.cost)
        expect(page).to have_content(onions.name)
        expect(page).to have_content(onions.cost)
        expect(page).to have_content(olives.name)
        expect(page).to have_content(olives.cost)
      end
    end
  end
end