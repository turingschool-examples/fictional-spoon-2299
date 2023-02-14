require 'rails_helper'

RSpec.describe IngredientsController, type: :feature do
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

        save_and_open_page

        expect(page).to have_content("Ingredients:")
        expect(page).to have_content("Name: #{cilantro.name}")
        expect(page).to have_content("Cost: #{cilantro.cost}")
        expect(page).to have_content("Name: #{onion.name}")
        expect(page).to have_content("Cost: #{onion.cost}")
        expect(page).to have_content("Name: #{olives.name}")
        expect(page).to have_content("Cost: #{olives.cost}")
      end
    end
  end
end